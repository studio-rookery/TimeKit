//
//  Initializer.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation
@testable import TimeKit

extension Date {
    
    static private let formatter: DateFormatter = {
        let calendar = Calendar.utc
        let formatter = DateFormatter()
        formatter.calendar = calendar
        formatter.timeZone = calendar.timeZone
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter
    }()
    
    init(_ utcDateString: String) {
        self = Date.formatter.date(from: utcDateString)!
    }
}

extension Day {
    
    init(_ string: String) {
        switch string {
        case "2000/12/30":
            self = Day(intervalSinceReferenceDate: -2)
        case "2000/12/31":
            self = Day(intervalSinceReferenceDate: -1)
        case "2001/01/01":
            self = Day(intervalSinceReferenceDate: 0)
        default:
            fatalError()
        }
    }
}

extension Month {
    
    init(_ string: String) {
        switch string {
        case "2000/12":
            self = Month(intervalSinceReferenceDate: -1)
        case "2001/01":
            self = Month(intervalSinceReferenceDate: 0)
        default:
            fatalError()
        }
    }
}

extension Year {
    
    init(_ string: String) {
        switch string {
        case "2000":
            self = Year(intervalSinceReferenceDate: -1)
        case "2001":
            self = Year(intervalSinceReferenceDate: 0)
        default:
            fatalError()
        }
    }
}
