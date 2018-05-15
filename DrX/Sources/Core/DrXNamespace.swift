import Foundation
import RxSwift

/// Encapsulates DrX extensions on an instance within a "proxy namespace" struct.
///
/// Custom operators belonging to this namespace can be called similar to
/// ```
/// ...
///
/// observable.drx.replace(lifting: "Hello, World!")
///     .bind(to: myLabel.rx.text)
///     .disposed(by: myDisposableContainer)
/// ...
/// ```
public struct DrXNamespace<SequenceType, Element> where SequenceType: ObservableType, Element == SequenceType.E {

    internal let decoratedSequence: SequenceType

    internal init(sequence: SequenceType) {
        decoratedSequence = sequence
    }

}

/// Encapsulates DrX extensions on a type within a "proxy namespace" struct.
///
/// Custom operators belonging to this namespace can be called similar to
/// ```
/// ...
///
/// Observable.and(.just(true), .just(true))
///     .withLatestFrom(someSequence) { $0 ? String(describing: $1) : "" }
///
/// ...
/// ```
public struct DrXFactoryNamespace<SequenceType, Element> where SequenceType: ObservableType, Element == SequenceType.E {

    internal let base: SequenceType.Type

    internal init(type: SequenceType.Type) {
        base = type
    }

}

public protocol DrXCompatible: ObservableType {
    associatedtype CompatibleType

    static var drx: DrXFactoryNamespace<Self, Self.E> { get }

    var drx: DrXNamespace<Self, Self.E> { get }

}

public extension ObservableType {
    typealias CompatibleType = Self

    public static var drx: DrXFactoryNamespace<Self, E> {
        return DrXFactoryNamespace(type: Self.self)
    }

    public var drx: DrXNamespace<Self, E> {
        return DrXNamespace(sequence: self)
    }

}
