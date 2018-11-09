import Foundation
import RxSwift
import UIKit

/// The `DrXTableViewHeaderFooterView` subclass of `UITableViewHeaderFooterView` provides
/// two bags for managing persistent and use-cycle subscriptions for instances.
open class DrXTableViewHeaderFooterView: UITableViewHeaderFooterView, DrXReuse {
    
    public final let persistentBag = DisposeBag()
    
    public private(set) final var reusableBag = DisposeBag()
    
    override open func prepareForReuse() {
        reusableBag = DisposeBag()
        super.prepareForReuse()
    }
    
}
