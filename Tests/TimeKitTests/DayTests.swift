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
}
