//
//  ObservableType+Bind.swift
//  DrX
//
//  Created by Kevin Li on 2/6/20.
//  Copyright © 2020 Duet Health. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import DrX

extension ObservableType {
    func bind<R: RelayType>(to relay: R) -> Disposable where R.Element == Element {
        bind(to: relay.asObserver())
    }
    
    func bind<R: RelayType>(to relay: R) -> Disposable where R.Element == Element? {
        map(Optional.some)
            .bind(to: relay.asObserver())
    }
}
