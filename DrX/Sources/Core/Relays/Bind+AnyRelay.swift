//
//  Bind+AnyRelay.swift
//  DrX
//
//  Created by ライアン on 12/7/18.
//  Copyright © 2018 Duet Health. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

public extension ObservableType {
    
    public func bind(to relay: AnyRelay<E>) -> Disposable {
        return bind(to: relay.asObserver())
    }
    
    public func bind(to relay: AnyRelay<E?>) -> Disposable {
        return bind(to: relay.asObserver())
    }
    
}
