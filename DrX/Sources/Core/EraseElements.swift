import Foundation
import RxSwift

public extension DrXNamespace {

    /// Erases the elements of the target `Observable`, leaving only the event.
    func eraseElements() -> Observable<Void> {
        return replace(lifting: ())
    }
    
}
