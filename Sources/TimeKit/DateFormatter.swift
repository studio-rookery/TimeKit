//
//  DateFormatter.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/31.
//

import Foundation

internal extension DateFormatter {
    
    static func makeDateFormatter(dateFormat: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = .utc
        dateFormatter.timeZone = Calendar.utc.timeZone
        dateFormatter.locale = Calendar.utc.locale
        dateFormatter.dateFormat = dateFormat
        return dateFormatter
    }
    
    static let dayFormatter = makeDateFormatter(dateFormat: "yyyy-MM-dd(EE)")
    static let monthFormatter = makeDateFormatter(dateFormat: "yyyy-MM")
    static let yearFormatter = makeDateFormatter(dateFormat: "yyyy")
}

public extension DateFormatter {
    
    /// Returns a string representation of a given day formatted using the receiver’s current settings.
    ///
    /// - Parameter day: the day to format.
    /// - Returns: A string representation of day formatted using the receiver’s current settings.
    func string(from day: Day) -> String {
        return string(from: calendar.startDate(of: day))
    }
    
    /// Returns a string representation of a given month formatted using the receiver’s current settings.
    ///
    /// - Parameter month: the month to format.
    /// - Returns: A string representation of month formatted using the receiver’s current settings.
    func string(from month: Month) -> String {
        return string(from: calendar.startDate(of: month))
    }
    
    /// Returns a string representation of a given month formatted using the receiver’s current settings.
    ///
    /// - Parameter month: the month to format.
    /// - Returns: A string representation of month formatted using the receiver’s current settings.
    func string(from year: Year) -> String {
        return string(from: calendar.startDate(of: year))
    }
    
    /// Returns a day representation of a given string interpreted using the receiver’s current settings.
    ///
    /// - Parameter string: the string to parse
    /// - Returns: A day representation of string interpreted using the receiver’s current settings. If this can not parse the string, returns nil.
    func day(from string: String) -> Day? {
        return date(from: string).map(calendar.day(for: ))
    }
    
    /// Returns a month representation of a given string interpreted using the receiver’s current settings.
    ///
    /// - Parameter string: the string to parse
    /// - Returns: A month representation of string interpreted using the receiver’s current settings. If this can not parse the string, returns nil.
    func month(from string: String) -> Month? {
        return date(from: string).map(calendar.month(for: ))
    }
    
    /// Returns a year representation of a given string interpreted using the receiver’s current settings.
    ///
    /// - Parameter string: the string to parse
    /// - Returns: A year representation of string interpreted using the receiver’s current settings. If this can not parse the string, returns nil.
    func year(from string: String) -> Year? {
        return date(from: string).map(calendar.year(for: ))
    }
}
