//
//  Weekday.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

public enum Weekday: Int, CaseIterable, Hashable, Codable {
    case sunday
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
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
    
    func advanced(by n: Int) -> Weekday {
        return Weekday(rawValue: rawValue + n)
    }
    
    func distance(toPrevious weekday: Weekday) -> Int {
        return -weekday.distance(toNext: self)
    }
    
    func distance(toNext nextWeekday: Weekday) -> Int {
        let distance = nextWeekday.rawValue - rawValue
        if distance < 1 {
            return distance + Weekday.allCases.count
        } else {
            return distance
        }
    }
}
