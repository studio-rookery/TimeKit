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
        case "2001/03/24":
            self = Day(intervalSinceReferenceDate: 82)
        case "2001/03/25":
            self = Day(intervalSinceReferenceDate: 83)
        case "2001/03/26":
            self = Day(intervalSinceReferenceDate: 84)
        case "2001/10/27":
            self = Day(intervalSinceReferenceDate: 299)
        case "2001/10/28":
            self = Day(intervalSinceReferenceDate: 300)
        case "2001/10/29":
            self = Day(intervalSinceReferenceDate: 301)
        case "2001/10/06":
            self = Day(intervalSinceReferenceDate: 278)
        case "2001/10/07":
            self = Day(intervalSinceReferenceDate: 279)
        case "2001/10/08":
            self = Day(intervalSinceReferenceDate: 280)
        case "2001/10/09":
            self = Day(intervalSinceReferenceDate: 281)
        case "2002/03/16":
            self = Day(intervalSinceReferenceDate: 439)
        case "2002/03/17":
            self = Day(intervalSinceReferenceDate: 440)
        case "2002/03/18":
            self = Day(intervalSinceReferenceDate: 441)
        case "2002/03/19":
            self = Day(intervalSinceReferenceDate: 442)
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
        case "2001/03":
            self = Month(intervalSinceReferenceDate: 2)
        case "2001/04":
            self = Month(intervalSinceReferenceDate: 3)
        case "2001/10":
            self = Month(intervalSinceReferenceDate: 9)
        case "2001/11":
            self = Month(intervalSinceReferenceDate: 10)
        case "2002/03":
            self = Month(intervalSinceReferenceDate: 14)
        case "2002/04":
            self = Month(intervalSinceReferenceDate: 15)
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
