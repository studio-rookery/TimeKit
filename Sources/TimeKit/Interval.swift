//
//  Interval.swift
//  TimeKit iOS
//
//  Created by hirano masaki on 2019/06/19.
//

import Foundation

/// `Interval` represents an interval between components of time, such as` Day`, `Month`, and` Year`.
public struct Interval<Value: ReferenceDateStrideable>: Hashable {
    
    public var value: Int
    
    public init(value: Int) {
        self.value = value
    }
}
