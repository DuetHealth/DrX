import Foundation
import RxSwift

public extension DrXNamespace {

    /// Zips into a tuple each element of the observable sequence and the given constant value.
    ///
    /// - Parameter value: the constant value with which to zip.
    func zip<R>(with value: R) -> Observable<(Element, R)> {
        return decoratedSequence.map { ($0, value) }
    }
    
}

