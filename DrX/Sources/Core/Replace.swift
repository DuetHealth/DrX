import Foundation
import RxSwift

public extension DrXNamespace {

    /// Replaces the emissions of the target `Observable` by lifting a new value into the stream.
    public func replace<R>(lifting element: R) -> Observable<R> {
        return decoratedSequence.map { _ in return element }
    }
    
}

public extension DrXNamespace where Element: Equatable {

    /// Replaces matching elements of the sequence with the given replacement.
    public func replace(_ value: Element, with replacement: Element) -> Observable<Element> {
        return decoratedSequence.map { $0 == value ? replacement : $0 }
    }

    /// Replaces matching elements of the sequence with nil.
    public func replaceWithNil(_ value: Element) -> Observable<Element?> {
        return decoratedSequence.map { $0 == value ? nil : value }
    }

}
