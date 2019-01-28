//
//  Calendar+Extension.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

extension Calendar {
    /// +00:00
    static public let utc: Calendar = {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar
    }()
    
    /// +09:00
    static let tokyo: Calendar = {
        var calendar = Calendar.utc
        calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
        return calendar
    }()
    
    /// -10:00
    static let honolulu: Calendar = {
        var calendar = Calendar.utc
        calendar.timeZone = TimeZone(identifier: "Pacific/Honolulu")!
        return calendar
    }()
    
    static let chinese: Calendar = {
        var calendar = Calendar(identifier: .chinese)
        calendar.locale = utc.locale
        calendar.timeZone = utc.timeZone
        return calendar
    }()
}
