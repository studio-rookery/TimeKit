//
//  Day.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

/// `Day` is a unit of time representing date without a TimeZone.
public struct Day: Hashable, Codable, ReferenceDateStrideable {
    
    public var intervalSinceReferenceDate: Int
    
    public init(intervalSinceReferenceDate: Int) {
        self.intervalSinceReferenceDate = intervalSinceReferenceDate
    }
    
    public var referenceDay: Day {
        Day(intervalSinceReferenceDate: 0)
    }
}

extension Day: CustomStringConvertible {
    
    public var description: String {
        return "\(DateFormatter.dayFormatter.string(from: self)) in gregorian calendar"
    }
}

public extension Day {
    
    /// Retruns a Day after a week.
    var nextWeek: Day {
        return advanced(by: Weekday.allCases.count)
    }
    
    /// Retruns a Day before a week.
    var lastWeek: Day {
        return advanced(by: -Weekday.allCases.count)
    }
}

public extension Day {
    
    /// Returns a Weekday of self in `gregorian` calendar.
    var weekday: Weekday {
        return Calendar.utc.weekday(for: self)
    }
    
    /// Returns a last weekday before this day in `gregorian` calendar.
    ///
    /// - Parameter weekday: the specified weekday.
    /// - Returns: a last day of a given weekday before self.
    func previous(_ weekday: Weekday) -> Day {
        return Calendar.utc.previous(weekday, before: self)
    }
    
    /// Returns a next weekday before self in `gregorian` calendar.
    ///
    /// - Parameter weekday: the specified weekday.
    /// - Returns: a last day of a given weekday after self.
    func next(_ weekday: Weekday) -> Day {
        return Calendar.utc.next(weekday, after: self)
    }
}
