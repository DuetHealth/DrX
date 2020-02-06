//
//  ObservableType+Relay.swift
//  DrX
//
//  Created by Kevin Li on 2/6/20.
//  Copyright © 2020 Duet Health. All rights reserved.
//

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
