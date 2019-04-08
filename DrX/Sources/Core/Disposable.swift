import Foundation
import RxSwift

fileprivate var disposableKey = UInt8.max

public extension Disposable {

    /// Retains the resources associated with a subscription until the argument object is deallocated.
    ///
    /// - Parameter object: the object to which this disposable's lifetime is tethered.
    func withLifetime(of object: AnyObject) {
        if let bag = objc_getAssociatedObject(object, &disposableKey) as? DisposeBag {
            bag.insert(self)
            return
        }
        let bag = DisposeBag()
        bag.insert(self)
        objc_setAssociatedObject(object, &disposableKey, bag, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }

}
