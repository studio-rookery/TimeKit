//
//  DayTests.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/23.
//

import XCTest
@testable import TimeKit

final class DayTests: XCTestCase {
    
    func testStride() {
        let x = Day(intervalSinceReferenceDate: 5)
        let y = Day(intervalSinceReferenceDate: 10)
        
        let n = x.distance(to: y)
        XCTAssertEqual(n, 5)
        XCTAssertEqual(x.advanced(by: n), y)
    }
    
    func testDescription() {
        XCTAssertEqual(
            Day(intervalSinceReferenceDate: 0).description,
            "2001-01-01(Mon) in gregorian calendar"
        )
    }
    
    func testAdvance() {
        var day = Day(intervalSinceReferenceDate: 0)
        day.advance(by: 5)
        XCTAssertEqual(day, Day(intervalSinceReferenceDate: 5))
    }
    
    func testNext() {
        XCTAssertEqual(Day(intervalSinceReferenceDate: 0).next, Day(intervalSinceReferenceDate: 1))
    }
    
    func testPrevious() {
        XCTAssertEqual(Day(intervalSinceReferenceDate: 0).previous, Day(intervalSinceReferenceDate: -1))
    }
    
    func testWeekday() {
        let day = Day(intervalSinceReferenceDate: 0)
        XCTAssertEqual(day.weekday, .monday)
    }
    
    func testPreviousWeekday() {
        let day = Day(intervalSinceReferenceDate: 0) // monday
        XCTAssertEqual(day.previous(.sunday), Day(intervalSinceReferenceDate: -1))
    }
    
    func testNextWeekday() {
        let day = Day(intervalSinceReferenceDate: 0) // monday
        XCTAssertEqual(day.next(.monday), Day(intervalSinceReferenceDate: 7))
    }
}
