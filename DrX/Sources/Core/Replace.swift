
import Foundation
import RxSwift

public extension DrXNamespace {

    /// Replaces the emissions of the target `Observable` by lifting a new value into the stream.
    public func replace<R>(lifting element: R) -> Observable<R> {
        return decoratedSequence.map { _ in return element }
    }
    
}
