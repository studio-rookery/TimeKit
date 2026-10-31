//
//  CalendarDayForDateTests.swift
//  TimeKitTests
//

import XCTest
@testable import TimeKit

/// `Calendar.day(for:)` is computed from the time zone offset instead of `dateComponents(_:from:to:)`.
/// These tests check it against the component based reference across time zones and DST transitions.
final class CalendarDayForDateTests: XCTestCase {

    private let calendars: [Calendar] = [
        .utc, .tokyo, .honolulu, .amsterdam, .auckland,
        .with(timeZone: "America/New_York"),
        .with(timeZone: "America/Sao_Paulo"),
        .with(timeZone: "Asia/Kathmandu"),
        .with(timeZone: "Australia/Lord_Howe"),
        .with(timeZone: "Pacific/Chatham"),
    ]

    func testMatchesReferenceAcrossYears() {
        // every 25 hours so that the time of day drifts through the whole day over the sweep
        let step: TimeInterval = 25 * 60 * 60
        for calendar in calendars {
            var date = Date("1995/01/01 00:00")
            let end = Date("2030/12/31 00:00")
            while date < end {
                XCTAssertEqual(
                    calendar.day(for: date), calendar.referenceDay(for: date),
                    "\(date) in \(calendar.timeZone.identifier)")
                date.addTimeInterval(step)
            }
        }
    }

    func testMatchesReferenceAroundDSTTransitions() {
        let transitions = [
            Date("2001/03/25 01:00"), Date("2001/10/28 01:00"), // Amsterdam
            Date("2001/10/06 14:00"), Date("2002/03/16 14:00"), // Auckland
            Date("2001/04/01 07:00"), Date("2001/10/28 06:00"), // New York
            Date("2001/10/14 03:00"), Date("2002/02/17 02:00"), // Sao Paulo (transitions at local midnight)
            Date("2001/10/06 15:30"), Date("2002/03/30 15:00"), // Lord Howe (30 minute DST)
            Date("2001/10/06 14:45"), Date("2002/03/16 14:45"), // Chatham
        ]
        for calendar in calendars {
            for transition in transitions {
                for minutes in stride(from: -180, through: 180, by: 5) {
                    let date = transition.addingTimeInterval(TimeInterval(minutes * 60))
                    XCTAssertEqual(
                        calendar.day(for: date), calendar.referenceDay(for: date),
                        "\(date) in \(calendar.timeZone.identifier)")
                }
            }
        }
    }

    func testMatchesReferenceBeforeReferenceDate() {
        for calendar in calendars {
            for date in [Date("1970/01/01 00:00"), Date("1999/12/31 23:59"), Date("2000/12/31 23:59")] {
                XCTAssertEqual(
                    calendar.day(for: date), calendar.referenceDay(for: date),
                    "\(date) in \(calendar.timeZone.identifier)")
            }
        }
    }

    func testMatchesReferenceInChineseCalendar() {
        let chinese = Calendar.chinese
        var date = Date("2000/01/01 00:00")
        while date < Date("2003/01/01 00:00") {
            XCTAssertEqual(chinese.day(for: date), chinese.referenceDay(for: date), "\(date)")
            date.addTimeInterval(25 * 60 * 60)
        }
    }
}

private extension Calendar {

    /// The previous, component based implementation of `day(for:)`
    func referenceDay(for date: Date) -> Day {
        let referenceDate = Date.referenceDate
        let offset = TimeInterval(timeZone.secondsFromGMT(for: referenceDate))
        let baseDate = referenceDate.addingTimeInterval(-offset)
        let start = dateInterval(of: .day, for: date)!.start
        return Day(intervalSinceReferenceDate: dateComponents([.day], from: baseDate, to: start).day!)
    }
}
