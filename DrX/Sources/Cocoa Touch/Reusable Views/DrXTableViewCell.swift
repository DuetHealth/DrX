#if canImport(UIKit)
import Foundation
import RxSwift
import UIKit

/// The `DrXTableViewCell` subclass of `UITableViewCell` provides two bags
/// for managing persistent and use-cycle subscriptions for instances.
open class DrXTableViewCell: UITableViewCell, DrXReuse {
    
    public final let persistentBag = DisposeBag()
    
    public private(set) final var reusableBag = DisposeBag()
    
    override open func prepareForReuse() {
        reusableBag = DisposeBag()
        super.prepareForReuse()
    }
    
}
#endif
