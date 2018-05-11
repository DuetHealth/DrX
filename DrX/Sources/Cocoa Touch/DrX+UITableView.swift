import Foundation
import RxSwift
import RxCocoa

public extension Reactive where Base: UITableView {

    /// Reactive wrapper for delegate message `tableView:didSelectRowAtIndexPath:`, specifying whether
    /// to automatically deselect the cell after selection.
    public func modelSelected<T>(_ type: T.Type, deselect: Bool) -> ControlEvent<T> {
        guard deselect else { return self.modelSelected(type) }
        let source = self.itemSelected
            .do(onNext: { indexPath in self.base.deselectRow(at: indexPath, animated: true) })
            .map { indexPath -> T in try! self.model(at: indexPath) }
        return ControlEvent(events: source)
    }

}
