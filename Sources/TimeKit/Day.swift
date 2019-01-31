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
