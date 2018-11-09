import Foundation
import RxSwift
import UIKit

/// The `DrXCollectionViewCell` subclass of `UICollectionViewCell` provides
/// two bags for managing persistent and use-cycle subscriptions for instances.
open class DrXCollectionViewCell: UICollectionViewCell, DrXReuse {
    
    public final let persistentBag = DisposeBag()
    
    public private(set) final var reusableBag = DisposeBag()
    
    override open func prepareForReuse() {
        reusableBag = DisposeBag()
        super.prepareForReuse()
    }
    
}
