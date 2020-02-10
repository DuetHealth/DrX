import Foundation
import RxSwift

/// Represents a push style sequence which may also observe other sequences or raw values by directly
/// accepting them into the sequence.
public protocol RelayType: ObservableType {
    func asObserver() -> AnyObserver<Element>
    func accept(_ event: Element)
}
