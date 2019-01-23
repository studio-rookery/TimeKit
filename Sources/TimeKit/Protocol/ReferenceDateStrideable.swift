//
//  ReferenceDateStrideable.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

public protocol ReferenceDateStrideable: Strideable where Stride == Int {
    
    var intervalSinceReferenceDate: Int { get }
    
    init(intervalSinceReferenceDate: Int)
}

public extension ReferenceDateStrideable {
    
    func distance(to other: Self) -> Stride {
        return intervalSinceReferenceDate.distance(to: other.intervalSinceReferenceDate)
    }
    
    func advanced(by n: Stride) -> Self {
        return Self(intervalSinceReferenceDate: intervalSinceReferenceDate + n)
    }
    
    mutating func advance(by n: Stride) {
        self = advanced(by: n)
    }
}

public extension ReferenceDateStrideable {
    
    var next: Self {
        return advanced(by: 1)
    }
    
    var previous: Self {
        return advanced(by: -1)
    }
}
