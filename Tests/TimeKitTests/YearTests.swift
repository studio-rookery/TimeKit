//
//  YearTests.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/31.
//

import XCTest
@testable import TimeKit

final class YearTests: XCTestCase {

    func testDescription() {
        XCTAssertEqual(
            Year(intervalSinceReferenceDate: 0).description,
            "2001 in gregorian calendar"
        )
    }
}
