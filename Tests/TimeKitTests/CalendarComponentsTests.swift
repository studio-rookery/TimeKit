//
//  CalendarComponentsTests.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/23.
//

import XCTest
@testable import TimeKit

final class CalendarComponentsTests: XCTestCase {
    
    let utc = Calendar.utc
    
    // MARK: - Day
    
    func testDayComponents() {
        let day = Day(intervalSinceReferenceDate: 0) // 2001-01-01
        
        let components = utc.dayComponents(from: day)
        
        XCTAssertEqual(components.year, 2001)
        XCTAssertEqual(components.month, 1)
        XCTAssertEqual(components.day, 1)
    }
    
    func testDayComponentsFromRange() {
        let start = Day(intervalSinceReferenceDate: 0) // 2001-01-01
        let end = Day(intervalSinceReferenceDate: 32) // 2001-02-02
        
        let components = utc.dayComponents(from: start, to: end)
        
        XCTAssertEqual(components.year, 0)
        XCTAssertEqual(components.month, 1)
        XCTAssertEqual(components.day, 1)
    }

    func testDayFromComponents() {
        let components = Day.Components(year: 2001, month: 1, day: 1)
        let day = utc.day(from: components)
        
        XCTAssertEqual(day.intervalSinceReferenceDate, 0)
    }
    
    // MARK: - Month
    
    func testMonthComponents() {
        let month = Month(intervalSinceReferenceDate: 0) // 2001-01
        
        let components = utc.monthComponents(from: month)
        
        XCTAssertEqual(components.year, 2001)
        XCTAssertEqual(components.month, 1)
    }
    
    func testMonthComponentsFromRange() {
        let start = Month(intervalSinceReferenceDate: 0) // 2001-01
        let end = Month(intervalSinceReferenceDate: 13) // 2002-02
        
        let components = utc.monthComponents(from: start, to: end)
        
        XCTAssertEqual(components.year, 1)
        XCTAssertEqual(components.month, 1)
    }
    
    func testMonthFromComponents() {
        let components = Month.Components(year: 2001, month: 1)
        let month = utc.month(from: components)
        
        XCTAssertEqual(month.intervalSinceReferenceDate, 0)
    }
    
    // MARK: - Year
    
    func testYearComponents() {
        let year = Year(intervalSinceReferenceDate: 0) // 2001
        
        let components = utc.yearComponents(from: year)
        
        XCTAssertEqual(components.year, 2001)
    }
    
    func testYearComponentsFromRange() {
        let start = Year(intervalSinceReferenceDate: 0) // 2001
        let end = Year(intervalSinceReferenceDate: 2) // 2003
        
        let components = utc.yearComponents(from: start, to: end)
        
        XCTAssertEqual(components.year, 2)
    }
     
    func testYearFromComponents() {
        let components = Year.Components(year: 2001)
        let year = utc.year(from: components)
        
        XCTAssertEqual(year.intervalSinceReferenceDate, 0)
    }
}
