//
//  Bind+AnyRelay.swift
//  DrX
//
//  Created by ライアン on 12/7/18.
//  Copyright © 2018 Duet Health. All rights reserved.
//

import Foundation
import RxRelay
import RxSwift

public extension ObservableType {

    func bind(to relay: AnyRelay<Element>) -> Disposable {
        return subscribe(relay.asObserver())
    }

    func bind(to relay: AnyRelay<Element?>) -> Disposable {
        return map(Optional.some)
            .subscribe(relay.asObserver())
    }

}
