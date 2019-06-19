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

public func + <DateComponent>(_ dateComponent: DateComponent, _ interval: Interval<DateComponent>) -> DateComponent where DateComponent: ReferenceDateStrideable {
    return dateComponent.advanced(by: interval.value)
}

public func += <DateComponent>(_ dateComponent: inout DateComponent, _ interval: Interval<DateComponent>) where DateComponent: ReferenceDateStrideable {
    dateComponent.advance(by: interval.value)
}

public func - <DateComponent>(_ dateComponent: DateComponent, _ interval: Interval<DateComponent>) -> DateComponent where DateComponent: ReferenceDateStrideable {
    return dateComponent.advanced(by: -interval.value)
}

public func -= <DateComponent>(_ dateComponent: inout DateComponent, _ interval: Interval<DateComponent>) where DateComponent: ReferenceDateStrideable {
    dateComponent.advance(by: -interval.value)
}
