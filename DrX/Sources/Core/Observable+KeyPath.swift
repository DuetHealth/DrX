import Foundation
import RxSwift

public extension DrXNamespace {

    /// Maps to a property of the elements of the source sequence.
    func access<R>(_ property: KeyPath<Element, R>) -> Observable<R> {
        return decoratedSequence.map { $0[keyPath: property] }
    }

}
