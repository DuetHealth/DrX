#if canImport(UIKit)
import Foundation
import RxSwift
import UIKit

/// Types which conform to `DrXReuse` provide ways for subclasses to maintain lifetime
/// and reuse-cycle subscriptions.
public protocol DrXReuse: AnyObject {
    
    /// The disposable container for any bindings with a lifetime equivalent to that of the object.
    /// Any resources are freed when the object is deallocated.
    var persistentBag: DisposeBag { get }
    
    /// The disposable container for any bindings with a lifetime equivalent that of the object's current
    /// use cycle. Any resources are freed when the object is reused.
    var reusableBag: DisposeBag { get }
    
    /// Prepares the object for reuse.
    func prepareForReuse()
    
}
#endif
