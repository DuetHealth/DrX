import Foundation
import RxSwift

public extension DrXNamespace {

    /// Projects each element of the sequence into a less-specialized form.
    func covariant<R>(of type: R.Type) -> Observable<R> {
        return decoratedSequence.map { element in
            guard let result = element as? R else {
                fatalError("Type \(SequenceType.Element.self) does not extend \(type).")
            }
            return result
        }
    }
}

public extension DrXNamespace where Element: Sequence {

    /// Projects each element of the emitted sequences into a less-specialized form.
    func covarying<R>(to type: R.Type) -> Observable<[R]> {
        return decoratedSequence.map { sequence in
            sequence.map { innerElement in
                guard let result = innerElement as? R else {
                    fatalError("Sequence type \(SequenceType.Element.self)) does not contain elements that extend \(type).")
                }
                return result
            }
        }
    }

}
