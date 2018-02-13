
import Foundation
import RxCocoa
import RxSwift
import UIKit

@available(iOS 9.0, *)
public class RxViewControllerPreviewingDelegateProxy: NSObject, UIViewControllerPreviewingDelegate {

    private weak var installedTable = UITableView?.none
    private weak var forwardedDelegate = UIViewControllerPreviewingDelegate?.none
    private var controllerForContext = UIViewController?.none
    private var handlers = [String: (UIViewController) -> ()]()

    var rx: Reactive<RxViewControllerPreviewingDelegateProxy> {
        return Reactive(self)
    }

    public init(tableView: UITableView, forwardedDelegate: UIViewControllerPreviewingDelegate?) {
        self.installedTable = tableView
        self.forwardedDelegate = forwardedDelegate
        super.init()
    }

    public func itemPeeked<T>(_ type: T.Type) -> Observable<T> {
        guard let tableView = installedTable else { return .empty() }
        return rx.sentMessage(#selector(UIViewControllerPreviewingDelegate.previewingContext(_:viewControllerForLocation:)))
            .map { arguments -> T? in
                let context = arguments[0] as! UIViewControllerPreviewing
                let location = arguments[1] as! CGPoint
                guard let indexPath = tableView.indexPathForRow(at: location) else { return nil }
                context.sourceRect = tableView.rectForRow(at: indexPath)
                return try? tableView.rx.model(at: indexPath)
            }
            .filter { $0 != nil }
            .map { $0! }
    }

    public func pop<O: ObservableType, V: UIViewController>(_ source: O) -> (_ commitLogic: @escaping (V) -> ()) -> Disposable where O.E == V {
        return { [unowned self] commitLogic in
            self.handlers[String(describing: V.self)] = { (controller: UIViewController) in
                commitLogic(controller as! V)
            }
            return source.observeOn(MainScheduler.instance).subscribe(onNext: { controller in
                self.controllerForContext = controller
            })
        }
    }

    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if controllerForContext == nil { return forwardedDelegate?.previewingContext(previewingContext, viewControllerForLocation: location) }
        return controllerForContext
    }

    public func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        if let handler = self.handlers[String(describing: type(of: viewControllerToCommit))] {
            handler(viewControllerToCommit)
        }
        forwardedDelegate?.previewingContext(previewingContext, commit: viewControllerToCommit)
    }

}

fileprivate var previewingDelegateKey = UInt8.max

public extension Reactive where Base: UITableView {

    @available(iOS 9.0, *)
    public func previewingDelegate(registrant controller: UIViewController) -> RxViewControllerPreviewingDelegateProxy {
        if let proxy = objc_getAssociatedObject(controller, &previewingDelegateKey) { return proxy as! RxViewControllerPreviewingDelegateProxy }
        let forwardedDelegate: UIViewControllerPreviewingDelegate?
        if controller.conforms(to: UIViewControllerPreviewingDelegate.self) {
            forwardedDelegate = controller as! UIViewControllerPreviewingDelegate
        } else { forwardedDelegate = nil }
        let proxy = RxViewControllerPreviewingDelegateProxy(tableView: base, forwardedDelegate: forwardedDelegate)
        objc_setAssociatedObject(controller, &previewingDelegateKey, proxy, .OBJC_ASSOCIATION_RETAIN)
        controller.registerForPreviewing(with: proxy, sourceView: base)
        return proxy
    }

}
