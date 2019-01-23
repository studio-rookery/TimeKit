//
//  IntTests.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/23.
//

import XCTest
@testable import TimeKit

final class IntTests: XCTestCase {
    
    func testDays() {
        
        let day = Day(intervalSinceReferenceDate: 0)
        
        XCTAssertEqual(
            5.days(from: day),
            [
                Day(intervalSinceReferenceDate: 0),
                Day(intervalSinceReferenceDate: 1),
                Day(intervalSinceReferenceDate: 2),
                Day(intervalSinceReferenceDate: 3),
                Day(intervalSinceReferenceDate: 4)
            ]
        )
        
        XCTAssertEqual(
            (-5).days(from: day),
            [
                Day(intervalSinceReferenceDate: -4),
                Day(intervalSinceReferenceDate: -3),
                Day(intervalSinceReferenceDate: -2),
                Day(intervalSinceReferenceDate: -1),
                Day(intervalSinceReferenceDate: 0)
            ]
        )
        
        XCTAssertEqual(
            0.days(from: day),
            []
        )
    }
    
    func testMonths() {
        
        let month = Month(intervalSinceReferenceDate: 0)
        
        XCTAssertEqual(
            5.months(from: month),
            [
                Month(intervalSinceReferenceDate: 0),
                Month(intervalSinceReferenceDate: 1),
                Month(intervalSinceReferenceDate: 2),
                Month(intervalSinceReferenceDate: 3),
                Month(intervalSinceReferenceDate: 4)
            ]
        )
        
        XCTAssertEqual(
            (-5).months(from: month),
            [
                Month(intervalSinceReferenceDate: -4),
                Month(intervalSinceReferenceDate: -3),
                Month(intervalSinceReferenceDate: -2),
                Month(intervalSinceReferenceDate: -1),
                Month(intervalSinceReferenceDate: 0)
            ]
        )
        
        XCTAssertEqual(
            0.months(from: month),
            []
        )
    }
    
    func testYears() {
        
        let year = Year(intervalSinceReferenceDate: 0)
        
        XCTAssertEqual(
            5.years(from: year),
            [
                Year(intervalSinceReferenceDate: 0),
                Year(intervalSinceReferenceDate: 1),
                Year(intervalSinceReferenceDate: 2),
                Year(intervalSinceReferenceDate: 3),
                Year(intervalSinceReferenceDate: 4)
            ]
        )
        
        XCTAssertEqual(
            (-5).years(from: year),
            [
                Year(intervalSinceReferenceDate: -4),
                Year(intervalSinceReferenceDate: -3),
                Year(intervalSinceReferenceDate: -2),
                Year(intervalSinceReferenceDate: -1),
                Year(intervalSinceReferenceDate: 0)
            ]
        )
        
        XCTAssertEqual(
            0.years(from: year),
            []
        )
    }
}
