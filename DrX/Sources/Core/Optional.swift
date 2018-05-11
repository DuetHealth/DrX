import Foundation
import RxSwift

public extension DrXNamespace {

    /// Makes the non-optional elements of the source sequence optional.
    public func optional() -> Observable<Element?> {
        return decoratedSequence.map { .some($0) }
    }
    
}
