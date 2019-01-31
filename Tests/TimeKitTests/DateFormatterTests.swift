//
//  DateFormatterTests.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/31.
//

import XCTest
@testable import TimeKit

final class DateFormatterTests: XCTestCase {
    
    func testStringFromDay() {
        let day = Day(intervalSinceReferenceDate: 0)
        XCTAssertEqual(DateFormatter.dayFormatter.string(from: day), "2001-01-01(Mon)")
    }
    
    func testStringFromMonth() {
        let month = Month(intervalSinceReferenceDate: 0)
        XCTAssertEqual(DateFormatter.monthFormatter.string(from: month), "2001-01")
    }
    
    func testStringFromYear() {
        let year = Day(intervalSinceReferenceDate: 0)
        XCTAssertEqual(DateFormatter.yearFormatter.string(from: year), "2001")
    }
    
    func testDayFromString() {
        let day = DateFormatter.dayFormatter.day(from: "2001-01-01(Mon)")
        XCTAssertEqual(day, Day(intervalSinceReferenceDate: 0))
    }
    
    func testMonthFromString() {
        let month = DateFormatter.monthFormatter.month(from: "2001-01")
        XCTAssertEqual(month, Month(intervalSinceReferenceDate: 0))
    }
    
    func testYearFromString() {
        let year = DateFormatter.yearFormatter.year(from: "2001")
        XCTAssertEqual(year, Year(intervalSinceReferenceDate: 0))
    }
}
