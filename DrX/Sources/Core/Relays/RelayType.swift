//
//  RelayType.swift
//  DrX
//
//  Created by Ryan Wachowski on 8/22/18.
//  Copyright © 2018 Duet Health. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

/// Represents a push style sequence which may also observe other sequences or raw values by directly
/// accepting them into the sequence.
public protocol RelayType: ObservableType {
    func asObserver() -> AnyObserver<Element>
    func accept(_ event: Element)
}
