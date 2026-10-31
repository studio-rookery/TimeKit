//
//  CalendarStartDateTests.swift
//  TimeKitTests
//

import XCTest
@testable import TimeKit

/// `Calendar.startDate(of: Day)` and `Calendar.day(for:)` must agree on which date a `Day` is,
/// including in zones that skipped a date by moving across the international date line.
final class CalendarStartDateTests: XCTestCase {

    private let skippedDays = [
        "Pacific/Apia": Day(year: 2011, month: 12, day: 30),
        "Pacific/Fakaofo": Day(year: 2011, month: 12, day: 30),
        "Pacific/Kiritimati": Day(year: 1994, month: 12, day: 31),
        "Pacific/Kwajalein": Day(year: 1993, month: 8, day: 21),
    ]

    private let otherZones = [
        "GMT", "Asia/Tokyo", "Pacific/Honolulu", "Europe/Amsterdam", "America/New_York",
        "America/Havana", "America/Sao_Paulo", "America/Danmarkshavn", "Asia/Kathmandu", "Australia/Lord_Howe",
    ]

    private var allZones: [String] {
        Array(skippedDays.keys) + otherZones
    }

    func testRoundTripAcrossYears() {
        for identifier in allZones {
            let calendar = Calendar.with(timeZone: identifier)
            for day in Day(year: 1990, month: 1, day: 1) ..< Day(year: 2031, month: 1, day: 1) where day != skippedDays[identifier] {
                XCTAssertEqual(calendar.day(for: calendar.startDate(of: day)), day, "\(day) in \(identifier)")
            }
        }
    }

    func testSameDayIsSameCivilDateInEveryZone() {
        let day = Day(year: 2026, month: 10, day: 31)
        for identifier in allZones {
            let calendar = Calendar.with(timeZone: identifier)
            XCTAssertEqual(calendar.dayComponents(from: day), Day.Components(year: 2026, month: 10, day: 31), identifier)
            XCTAssertEqual(calendar.weekday(for: day), .saturday, identifier)
        }
    }

    func testStartDatesNeverGoBackward() {
        for identifier in allZones {
            let calendar = Calendar.with(timeZone: identifier)
            for day in Day(year: 1990, month: 1, day: 1) ..< Day(year: 2031, month: 1, day: 1) {
                XCTAssertLessThanOrEqual(calendar.startDate(of: day), calendar.startDate(of: day.next), "\(day) in \(identifier)")
            }
        }
    }

    func testSkippedDateStartsWhenNextDateDoes() {
        for (identifier, skipped) in skippedDays {
            let calendar = Calendar.with(timeZone: identifier)

            XCTAssertEqual(calendar.startDate(of: skipped), calendar.startDate(of: skipped.next), identifier)
            XCTAssertTrue(calendar.dateRange(in: skipped).isEmpty, identifier)
            XCTAssertEqual(calendar.day(for: calendar.startDate(of: skipped)), skipped.next, identifier)
        }
    }

    func testDaysAroundSkippedDate() {
        let calendar = Calendar.with(timeZone: "Pacific/Apia")

        XCTAssertEqual(calendar.dayComponents(from: Day(year: 2011, month: 12, day: 29)), Day.Components(year: 2011, month: 12, day: 29))
        XCTAssertEqual(calendar.dayComponents(from: Day(year: 2011, month: 12, day: 31)), Day.Components(year: 2011, month: 12, day: 31))
        XCTAssertEqual(calendar.firstDay(of: calendar.month(for: Day(year: 2012, month: 1, day: 15))), Day(year: 2012, month: 1, day: 1))
    }

    func testFirstMidnightWhenDSTEndsAtMidnight() {
        let havana = Calendar.with(timeZone: "America/Havana")
        XCTAssertEqual(havana.startDate(of: Day(year: 1991, month: 10, day: 13)), Date("1991/10/13 04:00"))
    }

    func testStartDateWhenOffsetDiffersFromReferenceDate() {
        // This zone was on mountain time on the reference date and moved to central time later
        let newSalem = Calendar.with(timeZone: "America/North_Dakota/New_Salem")
        XCTAssertEqual(newSalem.startDate(of: Day(year: 2004, month: 10, day: 31)), Date("2004/10/31 05:00"))
    }

    func testRepeatedDateCoversBothCopies() {
        let kwajalein = Calendar.with(timeZone: "Pacific/Kwajalein")
        let repeated = Day(year: 1969, month: 9, day: 30)
        let range = kwajalein.dateRange(in: repeated)

        XCTAssertEqual(range.upperBound.timeIntervalSince(range.lowerBound), 47 * 60 * 60)
        XCTAssertEqual(kwajalein.day(for: range.lowerBound), repeated)
        XCTAssertEqual(kwajalein.day(for: range.upperBound.addingTimeInterval(-1)), repeated)
    }

    func testRoundTripBeforeCommonEra() {
        // August 2 BCE
        let day = Day(intervalSinceReferenceDate: -731_000)
        for calendar in [Calendar.utc, Calendar.tokyo] {
            XCTAssertEqual(calendar.day(for: calendar.startDate(of: day)), day)
        }
    }

    func testSameMomentInNonGregorianCalendars() {
        let identifiers: [Calendar.Identifier] = [.japanese, .buddhist, .hebrew, .islamicUmmAlQura, .chinese, .persian]
        let days = [Day(year: 1989, month: 1, day: 7), Day(year: 2019, month: 5, day: 1), Day(year: 2026, month: 10, day: 31)]
        for identifier in identifiers {
            var calendar = Calendar(identifier: identifier)
            calendar.timeZone = TimeZone(identifier: "Asia/Tokyo")!
            for day in days {
                XCTAssertEqual(calendar.startDate(of: day), Calendar.tokyo.startDate(of: day), "\(day) in \(identifier)")
                XCTAssertEqual(calendar.day(for: calendar.startDate(of: day)), day, "\(day) in \(identifier)")
            }
        }
    }
}

private extension Day {

    init(year: Int, month: Int, day: Int) {
        self = Calendar.utc.day(from: Day.Components(year: year, month: month, day: day))
    }
}
