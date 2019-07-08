//
//  MonthTests.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/31.
//

import XCTest
@testable import TimeKit

final class MonthTests: XCTestCase {

    func testDescription() {
        XCTAssertEqual(
            Month(intervalSinceReferenceDate: 0).description,
            "2001-01 in gregorian calendar"
        )
    }
    
    func testAddInterval() {
        var month = Month(intervalSinceReferenceDate: 0)
        month += 1.month
        XCTAssertEqual(month, Month(intervalSinceReferenceDate: 1))
    }
    
    func testSubstractInterval() {
        var month = Month(intervalSinceReferenceDate: 0)
        month -= 1.month
        XCTAssertEqual(month, Month(intervalSinceReferenceDate: -1))
    }
}
