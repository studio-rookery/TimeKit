//
//  Calendar+Extension.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation
@testable import TimeKit

extension Calendar {
    
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
