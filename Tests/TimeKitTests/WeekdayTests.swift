//
//  WeekdayTests.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/23.
//

import XCTest
@testable import TimeKit

final class WeekdayTests: XCTestCase {
    
    func testAdding() {
        XCTAssertEqual(Weekday.sunday.advanced(by: 1), .monday)
        XCTAssertEqual(Weekday.sunday.advanced(by: 7), .sunday)
        XCTAssertEqual(Weekday.sunday.advanced(by: 10), .wednesday)
    }
    
    func testDistanceToPrevious() {
        struct TestCase {
            let base: Weekday
            let previous: Weekday
            let distance: Int
            let line: UInt
            static func distance(from base: Weekday, toPrevious previous: Weekday, is distance: Int, line: UInt = #line) -> TestCase {
                return TestCase(base: base, previous: previous, distance: distance, line: line)
            }
        }
        
        let testCases: [TestCase] = [
            .distance(from: .sunday, toPrevious: .sunday   , is: -7),
            .distance(from: .sunday, toPrevious: .monday   , is: -6),
            .distance(from: .sunday, toPrevious: .tuesday  , is: -5),
            .distance(from: .sunday, toPrevious: .wednesday, is: -4),
            .distance(from: .sunday, toPrevious: .thursday , is: -3),
            .distance(from: .sunday, toPrevious: .friday   , is: -2),
            .distance(from: .sunday, toPrevious: .saturday , is: -1),
            
            .distance(from: .monday, toPrevious: .sunday   , is: -1),
            .distance(from: .monday, toPrevious: .monday   , is: -7),
            .distance(from: .monday, toPrevious: .tuesday  , is: -6),
            .distance(from: .monday, toPrevious: .wednesday, is: -5),
            .distance(from: .monday, toPrevious: .thursday , is: -4),
            .distance(from: .monday, toPrevious: .friday   , is: -3),
            .distance(from: .monday, toPrevious: .saturday , is: -2),
            
            .distance(from: .tuesday, toPrevious: .sunday   , is: -2),
            .distance(from: .tuesday, toPrevious: .monday   , is: -1),
            .distance(from: .tuesday, toPrevious: .tuesday  , is: -7),
            .distance(from: .tuesday, toPrevious: .wednesday, is: -6),
            .distance(from: .tuesday, toPrevious: .thursday , is: -5),
            .distance(from: .tuesday, toPrevious: .friday   , is: -4),
            .distance(from: .tuesday, toPrevious: .saturday , is: -3),
            
            .distance(from: .wednesday, toPrevious: .sunday   , is: -3),
            .distance(from: .wednesday, toPrevious: .monday   , is: -2),
            .distance(from: .wednesday, toPrevious: .tuesday  , is: -1),
            .distance(from: .wednesday, toPrevious: .wednesday, is: -7),
            .distance(from: .wednesday, toPrevious: .thursday , is: -6),
            .distance(from: .wednesday, toPrevious: .friday   , is: -5),
            .distance(from: .wednesday, toPrevious: .saturday , is: -4),
            
            .distance(from: .thursday, toPrevious: .sunday   , is: -4),
            .distance(from: .thursday, toPrevious: .monday   , is: -3),
            .distance(from: .thursday, toPrevious: .tuesday  , is: -2),
            .distance(from: .thursday, toPrevious: .wednesday, is: -1),
            .distance(from: .thursday, toPrevious: .thursday , is: -7),
            .distance(from: .thursday, toPrevious: .friday   , is: -6),
            .distance(from: .thursday, toPrevious: .saturday , is: -5),
            
            .distance(from: .friday, toPrevious: .sunday   , is: -5),
            .distance(from: .friday, toPrevious: .monday   , is: -4),
            .distance(from: .friday, toPrevious: .tuesday  , is: -3),
            .distance(from: .friday, toPrevious: .wednesday, is: -2),
            .distance(from: .friday, toPrevious: .thursday , is: -1),
            .distance(from: .friday, toPrevious: .friday   , is: -7),
            .distance(from: .friday, toPrevious: .saturday , is: -6),
            
            .distance(from: .saturday, toPrevious: .sunday   , is: -6),
            .distance(from: .saturday, toPrevious: .monday   , is: -5),
            .distance(from: .saturday, toPrevious: .tuesday  , is: -4),
            .distance(from: .saturday, toPrevious: .wednesday, is: -3),
            .distance(from: .saturday, toPrevious: .thursday , is: -2),
            .distance(from: .saturday, toPrevious: .friday   , is: -1),
            .distance(from: .saturday, toPrevious: .saturday , is: -7)
        ]
        
        testCases.forEach { testCase in
            XCTAssertEqual(testCase.base.distance(toPrevious: testCase.previous), testCase.distance, line: testCase.line)
        }
    }
    
    func testDistanceToNext() {
        
        struct TestCase {
            let base: Weekday
            let next: Weekday
            let distance: Int
            let line: UInt
            static func distance(from base: Weekday, toNext next: Weekday, is distance: Int, line: UInt = #line) -> TestCase {
                return TestCase(base: base, next: next, distance: distance, line: line)
            }
        }
        
        let testCases: [TestCase] = [
            .distance(from: .sunday, toNext: .sunday   , is: 7),
            .distance(from: .sunday, toNext: .monday   , is: 1),
            .distance(from: .sunday, toNext: .tuesday  , is: 2),
            .distance(from: .sunday, toNext: .wednesday, is: 3),
            .distance(from: .sunday, toNext: .thursday , is: 4),
            .distance(from: .sunday, toNext: .friday   , is: 5),
            .distance(from: .sunday, toNext: .saturday , is: 6),
            
            .distance(from: .monday, toNext: .sunday   , is: 6),
            .distance(from: .monday, toNext: .monday   , is: 7),
            .distance(from: .monday, toNext: .tuesday  , is: 1),
            .distance(from: .monday, toNext: .wednesday, is: 2),
            .distance(from: .monday, toNext: .thursday , is: 3),
            .distance(from: .monday, toNext: .friday   , is: 4),
            .distance(from: .monday, toNext: .saturday , is: 5),
            
            .distance(from: .tuesday, toNext: .sunday   , is: 5),
            .distance(from: .tuesday, toNext: .monday   , is: 6),
            .distance(from: .tuesday, toNext: .tuesday  , is: 7),
            .distance(from: .tuesday, toNext: .wednesday, is: 1),
            .distance(from: .tuesday, toNext: .thursday , is: 2),
            .distance(from: .tuesday, toNext: .friday   , is: 3),
            .distance(from: .tuesday, toNext: .saturday , is: 4),
            
            .distance(from: .wednesday, toNext: .sunday   , is: 4),
            .distance(from: .wednesday, toNext: .monday   , is: 5),
            .distance(from: .wednesday, toNext: .tuesday  , is: 6),
            .distance(from: .wednesday, toNext: .wednesday, is: 7),
            .distance(from: .wednesday, toNext: .thursday , is: 1),
            .distance(from: .wednesday, toNext: .friday   , is: 2),
            .distance(from: .wednesday, toNext: .saturday , is: 3),
            
            .distance(from: .thursday, toNext: .sunday   , is: 3),
            .distance(from: .thursday, toNext: .monday   , is: 4),
            .distance(from: .thursday, toNext: .tuesday  , is: 5),
            .distance(from: .thursday, toNext: .wednesday, is: 6),
            .distance(from: .thursday, toNext: .thursday , is: 7),
            .distance(from: .thursday, toNext: .friday   , is: 1),
            .distance(from: .thursday, toNext: .saturday , is: 2),
            
            .distance(from: .friday, toNext: .sunday   , is: 2),
            .distance(from: .friday, toNext: .monday   , is: 3),
            .distance(from: .friday, toNext: .tuesday  , is: 4),
            .distance(from: .friday, toNext: .wednesday, is: 5),
            .distance(from: .friday, toNext: .thursday , is: 6),
            .distance(from: .friday, toNext: .friday   , is: 7),
            .distance(from: .friday, toNext: .saturday , is: 1),
            
            .distance(from: .saturday, toNext: .sunday   , is: 1),
            .distance(from: .saturday, toNext: .monday   , is: 2),
            .distance(from: .saturday, toNext: .tuesday  , is: 3),
            .distance(from: .saturday, toNext: .wednesday, is: 4),
            .distance(from: .saturday, toNext: .thursday , is: 5),
            .distance(from: .saturday, toNext: .friday   , is: 6),
            .distance(from: .saturday, toNext: .saturday , is: 7)
        ]
        
        testCases.forEach { testCase in
            XCTAssertEqual(testCase.base.distance(toNext: testCase.next), testCase.distance, line: testCase.line)
        }
    }
}
