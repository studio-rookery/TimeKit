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
    
    func string(from day: Day) -> String {
        return string(from: calendar.startDate(of: day))
    }
    
    func string(from month: Month) -> String {
        return string(from: calendar.startDate(of: month))
    }
    
    func string(from year: Year) -> String {
        return string(from: calendar.startDate(of: year))
    }
    
    func day(from string: String) -> Day? {
        return date(from: string).map(calendar.day(for: ))
    }
    
    func month(from string: String) -> Month? {
        return date(from: string).map(calendar.month(for: ))
    }
    
    func year(from string: String) -> Year? {
        return date(from: string).map(calendar.year(for: ))
    }
}
