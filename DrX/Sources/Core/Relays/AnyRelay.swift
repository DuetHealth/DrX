//
//  AnyRelay.swift
//  DrX
//
//  Created by Ryan Wachowski on 8/22/18.
//  Copyright © 2018 Duet Health. All rights reserved.
//

import Foundation
import RxSwift

/// Provides a type-erased interface for relays and relay-like types or controls.
public struct AnyRelay<Element>: RelayType {
    public typealias E = Element
    
    public let base: Any
    private let asObserverClosure: () -> AnyObserver<Element>
    private let subscribeClosure: (AnyObserver<Element>) -> Disposable
    private let acceptClosure: (Element) -> ()
    
    public init<R: RelayType>(_ relay: R) where R.Element == Element {
        base = relay
        asObserverClosure = relay.asObserver
        acceptClosure = relay.accept
        subscribeClosure = relay.subscribe
    }
    
    public init<O: ObservableConvertibleType>(_ property: O, accept: @escaping (Element) -> ()) where O.Element == Element {
        base = property
        asObserverClosure = {
            AnyObserver { event in
                switch event {
                case .next(let next): accept(next)
                case .error(let error): fatalError("Binding error to relay: \(error)")
                case .completed: return
                }
            }
        }
        acceptClosure = accept
        subscribeClosure = property.asObservable().subscribe
    }
    
    public func asObserver() -> AnyObserver<Element> {
        return asObserverClosure()
    }
    
    public func accept(_ event: Element) {
        acceptClosure(event)
    }
    
    public func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.Element == Element {
        return subscribeClosure(AnyObserver(observer))
    }
    
}
