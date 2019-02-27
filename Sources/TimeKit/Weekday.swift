//
//  Weekday.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

/// `Weekday` represents the day of the week.
/// `rawValue` corresponds to the value returned by `DateComponents.weekday`.
public enum Weekday: Int, CaseIterable, Hashable, Codable {
    /// sunday
    case sunday
    /// monday
    case monday
    /// tuesday
    case tuesday
    /// wednesday
    case wednesday
    /// thursday
    case thursday
    /// friday
    case friday
    /// saturday
    case saturday
    
    public init(rawValue: Int) {
        switch (rawValue % 7) {
        case 0:
            self = .sunday
        case 1, -6:
            self = .monday
        case 2, -5:
            self = .tuesday
        case 3, -4:
            self = .wednesday
        case 4, -3:
            self = .thursday
        case 5, -2:
            self = .friday
        case 6, -1:
            self = .saturday
        default:
            fatalError()
        }
    }
}

extension Weekday: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .sunday:
            return "sunday"
        case .monday:
            return "monday"
        case .tuesday:
            return "tuesday"
        case .wednesday:
            return "wednesday"
        case .thursday:
            return "thursday"
        case .friday:
            return "friday"
        case .saturday:
            return "saturday"
        }
    }
}

public extension Weekday {
    
    /// Returns `Weekday` adding the specified number of days.
    ///
    /// - Parameter n: the number of days to add.
    /// - Returns: `Weekday` added the specified number of days.
    func advanced(by n: Int) -> Weekday {
        return Weekday(rawValue: rawValue + n)
    }
    
    /// Returns distance to the specified previous weekday.
    ///
    /// - Parameter weekday: the weekday to compare.
    /// - Returns: distance between the specified weekday and self.
    func distance(toPrevious weekday: Weekday) -> Int {
        return -weekday.distance(toNext: self)
    }
    
    /// Returns distance to the specified next weekday.
    ///
    /// - Parameter weekday: the weekday to compare.
    /// - Returns: distance between the specified weekday and self.
    func distance(toNext nextWeekday: Weekday) -> Int {
        let distance = nextWeekday.rawValue - rawValue
        if distance < 1 {
            return distance + Weekday.allCases.count
        } else {
            return distance
        }
    }
}
