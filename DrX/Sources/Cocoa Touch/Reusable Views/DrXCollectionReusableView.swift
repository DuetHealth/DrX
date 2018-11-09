import Foundation
import RxSwift
import UIKit

/// The `DrXCollectionReusableView` subclass of `UICollectionReusableView` provides
/// two bags for managing persistent and use-cycle subscriptions for instances.
open class DrXCollectionReusableView: UICollectionReusableView, DrXReuse {
    
    public final let persistentBag = DisposeBag()
    
    public private(set) final var reusableBag = DisposeBag()
    
    override open func prepareForReuse() {
        reusableBag = DisposeBag()
        super.prepareForReuse()
    }
    
}
