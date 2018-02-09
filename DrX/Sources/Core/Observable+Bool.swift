
import Foundation
import RxSwift

public extension DrXNamespace where Element == Bool {

    /// Emits only when the element is `true`.
    public func whenTrue() -> Observable<Element> {
        return decoratedSequence.filter { $0 }
    }

    /// Emits only when the element is `false`.
    public func whenFalse() -> Observable<Element> {
        return decoratedSequence.filter { !$0 }
    }

    /// Emits the given value when the source emits `true`.
    ///
    /// - Parameter value: the constant value to emit.
    public func whenTrue<R>(send value: R) -> Observable<R> {
        return decoratedSequence.filter { $0 }
            .drx.replace(lifting: value)
    }

    /// Emits the given value when the source emits `false`.
    ///
    /// - Parameter value: the constant value to emit.
    public func whenFalse<R>(send value: R) -> Observable<R> {
        return decoratedSequence.filter { !$0 }
            .drx.replace(lifting: value)
    }


    /// Emits the given values conditional on the emitted Boolean.
    ///
    /// - Parameters:
    ///   - satisfied: the constant value to emit when `true`.
    ///   - unsatisfied: the constant value to emit when `false`.
    public func ifTrue<R>(then satisfied: R, else unsatisfied: R) -> Observable<R> {
        return decoratedSequence.map { $0 ? satisfied : unsatisfied }
    }

    /// Emits the given values conditional on the emitted Boolean.
    ///
    /// - Parameters:
    ///   - satisfied: the constant value to emit when `false`.
    ///   - unsatisfied: the constant value to emit when `true`.
    public func ifFalse<R>(then satisfied: R, else unsatisfied: R) -> Observable<R> {
        return ifTrue(then: unsatisfied, else: satisfied)
    }

}
