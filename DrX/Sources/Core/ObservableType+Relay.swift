import Foundation
import RxSwift

extension ObservableType {
    
    func bind<R: RelayType>(to relay: R) -> Disposable where R.Element == Element {
        subscribe(relay.asObserver())
    }
    
    func bind<R: RelayType>(to relay: R) -> Disposable where R.Element == Element? {
        map(Optional.some)
            .subscribe(relay.asObserver())
    }
    
}
