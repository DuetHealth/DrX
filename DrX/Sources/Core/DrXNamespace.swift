
import Foundation
import RxSwift

/// Encapsulates DrX extensions within a "proxy namespace" struct.
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

public extension ObservableType {

    public var drx: DrXNamespace<Self, E> {
        return DrXNamespace(sequence: self)
    }

}
