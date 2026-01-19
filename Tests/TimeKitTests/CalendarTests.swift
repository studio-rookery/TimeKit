//
//  CalendarTests.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/23.
//

import XCTest
@testable import TimeKit

final class CalendarTests: XCTestCase {
    
    let utc = Calendar.utc
    
    let startDate_2001_01_01 = Date.referenceDate
    
    let day_2001_01_01_mon = Day(intervalSinceReferenceDate: 0)
    let day_2001_01_02_tue = Day(intervalSinceReferenceDate: 1)
    let day_2001_01_03_wed = Day(intervalSinceReferenceDate: 2)
    let day_2001_01_04_thu = Day(intervalSinceReferenceDate: 3)
    let day_2001_01_05_fri = Day(intervalSinceReferenceDate: 4)
    let day_2001_01_06_sat = Day(intervalSinceReferenceDate: 5)
    let day_2001_01_07_sun = Day(intervalSinceReferenceDate: 6)
    let day_2001_01_08_mon = Day(intervalSinceReferenceDate: 7)
    let day_2001_01_31_wed = Day(intervalSinceReferenceDate: 30)
    let day_2001_02_02_thu = Day(intervalSinceReferenceDate: 31)
    let day_2001_12_31_mon = Day(intervalSinceReferenceDate: 364)
    let day_2002_01_01_tue = Day(intervalSinceReferenceDate: 365)
    
    let month_2001_01 = Month(intervalSinceReferenceDate: 0)
    let month_2001_12 = Month(intervalSinceReferenceDate: 11)
    let month_2002_01 = Month(intervalSinceReferenceDate: 12)
    
    let year_2001 = Year(intervalSinceReferenceDate: 0)
    
    // MARK: - Day
    
    func testFirstDayOfMonth() {
        XCTAssertEqual(utc.firstDay(of: month_2001_01), day_2001_01_01_mon)
    }
    
    func testFirstDayOfYear() {
        XCTAssertEqual(utc.firstDay(of: year_2001), day_2001_01_01_mon)
    }
    
    func testIsFirstDayOfMonth() {
        XCTAssertTrue(utc.isFirstDayOfMonth(day_2001_01_01_mon))
        XCTAssertFalse(utc.isFirstDayOfMonth(day_2001_01_02_tue))
    }
    
    // MARK: - Month
    
    func testMonthForDay() {
        XCTAssertEqual(utc.month(for: day_2001_01_01_mon), month_2001_01)
    }
    
    func testFirstMonthOfYear() {
        XCTAssertEqual(utc.firstMonth(of: year_2001), month_2001_01)
    }
    
    // MARK: - Year
    
    func testYearForDay() {
        XCTAssertEqual(utc.year(for: day_2001_01_01_mon), year_2001)
    }
    
    func testYearForMonth() {
        XCTAssertEqual(utc.year(for: month_2001_01), year_2001)
    }
    
    // MARK: - Weekday
    
    func testWeekDayForDate() {
        XCTAssertEqual(utc.weekday(for: startDate_2001_01_01), .monday)
    }
    
    func testWeekDayForDay() {
        XCTAssertEqual(utc.weekday(for: day_2001_01_01_mon), .monday)
        XCTAssertEqual(utc.weekday(for: day_2001_01_02_tue), .tuesday)
        XCTAssertEqual(utc.weekday(for: day_2001_01_03_wed), .wednesday)
        XCTAssertEqual(utc.weekday(for: day_2001_01_04_thu), .thursday)
        XCTAssertEqual(utc.weekday(for: day_2001_01_05_fri), .friday)
        XCTAssertEqual(utc.weekday(for: day_2001_01_06_sat), .saturday)
        XCTAssertEqual(utc.weekday(for: day_2001_01_07_sun), .sunday)
    }
    
    func testNextWeekdayAfter() {
        XCTAssertEqual(utc.next(.monday, after: day_2001_01_01_mon), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, after: day_2001_01_02_tue), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, after: day_2001_01_03_wed), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, after: day_2001_01_04_thu), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, after: day_2001_01_05_fri), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, after: day_2001_01_06_sat), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, after: day_2001_01_07_sun), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, after: day_2001_01_08_mon), day_2001_01_08_mon.nextWeek)
    }
    
    func testNextWeekdayOnOrAfter() {
        XCTAssertEqual(utc.next(.monday, onOrAfter: day_2001_01_01_mon), day_2001_01_01_mon)
        XCTAssertEqual(utc.next(.monday, onOrAfter: day_2001_01_02_tue), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, onOrAfter: day_2001_01_03_wed), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, onOrAfter: day_2001_01_04_thu), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, onOrAfter: day_2001_01_05_fri), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, onOrAfter: day_2001_01_06_sat), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, onOrAfter: day_2001_01_07_sun), day_2001_01_08_mon)
        XCTAssertEqual(utc.next(.monday, onOrAfter: day_2001_01_08_mon), day_2001_01_08_mon)
    }
    
    func testPreviousWeekdayBefore() {
        XCTAssertEqual(utc.previous(.monday, before: day_2001_01_01_mon), day_2001_01_01_mon.lastWeek)
        XCTAssertEqual(utc.previous(.monday, before: day_2001_01_02_tue), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, before: day_2001_01_03_wed), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, before: day_2001_01_04_thu), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, before: day_2001_01_05_fri), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, before: day_2001_01_06_sat), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, before: day_2001_01_07_sun), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, before: day_2001_01_08_mon), day_2001_01_01_mon)
    }
    
    func testPreivousWeekdayOnOrBefore() {
        XCTAssertEqual(utc.previous(.monday, onOrBefore: day_2001_01_01_mon), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, onOrBefore: day_2001_01_02_tue), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, onOrBefore: day_2001_01_03_wed), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, onOrBefore: day_2001_01_04_thu), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, onOrBefore: day_2001_01_05_fri), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, onOrBefore: day_2001_01_06_sat), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, onOrBefore: day_2001_01_07_sun), day_2001_01_01_mon)
        XCTAssertEqual(utc.previous(.monday, onOrBefore: day_2001_01_08_mon), day_2001_01_08_mon)
    }
}

extension CalendarTests {
    
    func testStartDateOfDay() {
        runTestCases(
            .startDate(of: Day("2001/01/01"), is: Date("2001/01/01 00:00"), in: .utc),
            .startDate(of: Day("2001/01/01"), is: Date("2000/12/31 15:00"), in: .tokyo),
            .startDate(of: Day("2001/01/01"), is: Date("2001/01/01 10:00"), in: .honolulu),
            .startDate(of: Day("2001/01/01"), is: Date("2000/12/31 23:00"), in: .amsterdam),
            .startDate(of: Day("2001/01/01"), is: Date("2000/12/31 11:00"), in: .auckland),
            .startDate(of: Day("2001/01/01"), is: Date("2001/01/01 00:00"), in: .chinese),
            
            // Daylight Saving Time
            .startDate(of: Day("2001/03/25"), is: Date("2001/03/24 23:00"), in: .amsterdam),
            .startDate(of: Day("2001/03/26"), is: Date("2001/03/25 22:00"), in: .amsterdam),
            .startDate(of: Day("2001/10/27"), is: Date("2001/10/26 22:00"), in: .amsterdam),
            .startDate(of: Day("2001/10/28"), is: Date("2001/10/27 22:00"), in: .amsterdam),
            .startDate(of: Day("2001/10/29"), is: Date("2001/10/28 23:00"), in: .amsterdam),
            
            .startDate(of: Day("2001/10/06"), is: Date("2001/10/05 12:00"), in: .auckland),
            .startDate(of: Day("2001/10/07"), is: Date("2001/10/06 12:00"), in: .auckland),
            .startDate(of: Day("2001/10/08"), is: Date("2001/10/07 11:00"), in: .auckland),
            .startDate(of: Day("2002/03/16"), is: Date("2002/03/15 11:00"), in: .auckland),
            .startDate(of: Day("2002/03/17"), is: Date("2002/03/16 11:00"), in: .auckland),
            .startDate(of: Day("2002/03/18"), is: Date("2002/03/17 12:00"), in: .auckland)
        )
    }
    
    func testStartDateOfMonth() {
        runTestCases(
            .startDate(of: Month("2001/01"), is: Date("2001/01/01 00:00"), in: .utc),
            .startDate(of: Month("2001/01"), is: Date("2000/12/31 15:00"), in: .tokyo),
            .startDate(of: Month("2001/01"), is: Date("2001/01/01 10:00"), in: .honolulu),
            .startDate(of: Month("2001/01"), is: Date("2000/12/31 23:00"), in: .amsterdam),
            .startDate(of: Month("2001/01"), is: Date("2000/12/26 00:00"), in: .chinese),
            
            // Daylight Saving Time
            .startDate(of: Month("2001/03"), is: Date("2001/02/28 23:00"), in: .amsterdam),
            .startDate(of: Month("2001/04"), is: Date("2001/03/31 22:00"), in: .amsterdam),
            .startDate(of: Month("2001/10"), is: Date("2001/09/30 22:00"), in: .amsterdam),
            .startDate(of: Month("2001/11"), is: Date("2001/10/31 23:00"), in: .amsterdam),
            
            .startDate(of: Month("2001/10"), is: Date("2001/09/30 12:00"), in: .auckland),
            .startDate(of: Month("2001/11"), is: Date("2001/10/31 11:00"), in: .auckland),
            .startDate(of: Month("2002/03"), is: Date("2002/02/28 11:00"), in: .auckland),
            .startDate(of: Month("2002/04"), is: Date("2002/03/31 12:00"), in: .auckland)
        )
    }
    
    func testStartDateOfYear() {
        runTestCases(
            .startDate(of: Year("2001"), is: Date("2001/01/01 00:00"), in: .utc),
            .startDate(of: Year("2001"), is: Date("2000/12/31 15:00"), in: .tokyo),
            .startDate(of: Year("2001"), is: Date("2001/01/01 10:00"), in: .honolulu),
            .startDate(of: Year("2001"), is: Date("2000/12/31 23:00"), in: .amsterdam),
            .startDate(of: Year("2001"), is: Date("2000/12/31 11:00"), in: .auckland),
            .startDate(of: Year("2001"), is: Date("2000/02/05 00:00"), in: .chinese)
        )
    }
    
    func testDayForDate() {
        runTestCases(
            .date(Date("2001/01/01 00:00"), is: Day("2001/01/01"), in: .utc),
            .date(Date("2001/01/01 00:00"), is: Day("2001/01/01"), in: .tokyo),
            .date(Date("2001/01/01 00:00"), is: Day("2000/12/31"), in: .honolulu),
            .date(Date("2001/01/01 00:00"), is: Day("2001/01/01"), in: .amsterdam),
            
            .date(Date("2000/12/31 14:59"), is: Day("2000/12/31"), in: .utc),
            .date(Date("2000/12/31 14:59"), is: Day("2000/12/31"), in: .tokyo),
            .date(Date("2000/12/31 14:59"), is: Day("2000/12/31"), in: .honolulu),
            .date(Date("2000/12/31 14:59"), is: Day("2000/12/31"), in: .amsterdam),
            
            .date(Date("2000/12/31 15:00"), is: Day("2000/12/31"), in: .utc),
            .date(Date("2000/12/31 15:00"), is: Day("2001/01/01"), in: .tokyo),
            .date(Date("2000/12/31 15:00"), is: Day("2000/12/31"), in: .honolulu),
            .date(Date("2000/12/31 15:00"), is: Day("2000/12/31"), in: .amsterdam),
            
            .date(Date("2000/12/31 10:00"), is: Day("2000/12/31"), in: .utc),
            .date(Date("2000/12/31 10:00"), is: Day("2000/12/31"), in: .tokyo),
            .date(Date("2000/12/31 10:00"), is: Day("2000/12/31"), in: .honolulu),
            .date(Date("2000/12/31 10:00"), is: Day("2000/12/31"), in: .amsterdam),
            
            .date(Date("2000/12/31 09:59"), is: Day("2000/12/31"), in: .utc),
            .date(Date("2000/12/31 09:59"), is: Day("2000/12/31"), in: .tokyo),
            .date(Date("2000/12/31 09:59"), is: Day("2000/12/30"), in: .honolulu),
            .date(Date("2000/12/31 09:59"), is: Day("2000/12/31"), in: .amsterdam),
            
            .date(Date("2000/12/31 23:00"), is: Day("2000/12/31"), in: .utc),
            .date(Date("2000/12/31 23:00"), is: Day("2001/01/01"), in: .tokyo),
            .date(Date("2000/12/31 23:00"), is: Day("2000/12/31"), in: .honolulu),
            .date(Date("2000/12/31 23:00"), is: Day("2001/01/01"), in: .amsterdam),
            
            .date(Date("2000/12/31 22:59"), is: Day("2000/12/31"), in: .utc),
            .date(Date("2000/12/31 22:59"), is: Day("2001/01/01"), in: .tokyo),
            .date(Date("2000/12/31 22:59"), is: Day("2000/12/31"), in: .honolulu),
            .date(Date("2000/12/31 22:59"), is: Day("2000/12/31"), in: .amsterdam),
            
            // Daylight Saving Time
            .date(Date("2001/03/24 22:00"), is: Day("2001/03/24"), in: .amsterdam),
            .date(Date("2001/03/25 22:00"), is: Day("2001/03/26"), in: .amsterdam),
            .date(Date("2001/10/27 22:00"), is: Day("2001/10/28"), in: .amsterdam),
            .date(Date("2001/10/28 22:00"), is: Day("2001/10/28"), in: .amsterdam),
            .date(Date("2001/10/28 23:00"), is: Day("2001/10/29"), in: .amsterdam),
            
            // Auckland
            .date(Date("2001/10/06 12:00"), is: Day("2001/10/07"), in: .auckland),
            .date(Date("2001/10/07 11:00"), is: Day("2001/10/08"), in: .auckland),
            .date(Date("2001/10/08 11:00"), is: Day("2001/10/09"), in: .auckland),
            .date(Date("2002/03/16 11:00"), is: Day("2002/03/17"), in: .auckland),
            .date(Date("2002/03/17 11:00"), is: Day("2002/03/17"), in: .auckland),
            .date(Date("2002/03/17 12:00"), is: Day("2002/03/18"), in: .auckland),
            .date(Date("2002/03/18 12:00"), is: Day("2002/03/19"), in: .auckland)
        )
    }
    
    func testMonthForDate() {
        runTestCases(
            .date(Date("2001/01/01 00:00"), is: Month("2001/01"), in: .utc),
            .date(Date("2001/01/01 00:00"), is: Month("2001/01"), in: .tokyo),
            .date(Date("2001/01/01 00:00"), is: Month("2000/12"), in: .honolulu),
            .date(Date("2001/01/01 00:00"), is: Month("2001/01"), in: .amsterdam),
            
            .date(Date("2000/12/31 14:59"), is: Month("2000/12"), in: .utc),
            .date(Date("2000/12/31 14:59"), is: Month("2000/12"), in: .tokyo),
            .date(Date("2000/12/31 14:59"), is: Month("2000/12"), in: .honolulu),
            .date(Date("2000/12/31 14:59"), is: Month("2000/12"), in: .amsterdam),
            
            .date(Date("2000/12/31 15:00"), is: Month("2000/12"), in: .utc),
            .date(Date("2000/12/31 15:00"), is: Month("2001/01"), in: .tokyo),
            .date(Date("2000/12/31 15:00"), is: Month("2000/12"), in: .honolulu),
            .date(Date("2000/12/31 15:00"), is: Month("2000/12"), in: .amsterdam),
            
            .date(Date("2000/12/31 10:00"), is: Month("2000/12"), in: .utc),
            .date(Date("2000/12/31 10:00"), is: Month("2000/12"), in: .tokyo),
            .date(Date("2000/12/31 10:00"), is: Month("2000/12"), in: .honolulu),
            .date(Date("2000/12/31 10:00"), is: Month("2000/12"), in: .amsterdam),
            
            .date(Date("2000/12/31 09:59"), is: Month("2000/12"), in: .utc),
            .date(Date("2000/12/31 09:59"), is: Month("2000/12"), in: .tokyo),
            .date(Date("2000/12/31 09:59"), is: Month("2000/12"), in: .honolulu),
            .date(Date("2000/12/31 09:59"), is: Month("2000/12"), in: .amsterdam),
            
            .date(Date("2000/12/31 23:00"), is: Month("2000/12"), in: .utc),
            .date(Date("2000/12/31 23:00"), is: Month("2001/01"), in: .tokyo),
            .date(Date("2000/12/31 23:00"), is: Month("2000/12"), in: .honolulu),
            .date(Date("2000/12/31 23:00"), is: Month("2001/01"), in: .amsterdam),
            
            .date(Date("2000/12/31 22:59"), is: Month("2000/12"), in: .utc),
            .date(Date("2000/12/31 22:59"), is: Month("2001/01"), in: .tokyo),
            .date(Date("2000/12/31 22:59"), is: Month("2000/12"), in: .honolulu),
            .date(Date("2000/12/31 22:59"), is: Month("2000/12"), in: .amsterdam),
            
            // Auckland
            .date(Date("2001/09/30 12:00"), is: Month("2001/10"), in: .auckland),
            .date(Date("2001/10/31 11:00"), is: Month("2001/11"), in: .auckland),
            .date(Date("2002/02/28 11:00"), is: Month("2002/03"), in: .auckland),
            .date(Date("2002/03/31 12:00"), is: Month("2002/04"), in: .auckland)
        )
    }
    
    func testYearForDate() {
        runTestCases(
            .date(Date("2001/01/01 00:00"), is: Year("2001"), in: .utc),
            .date(Date("2001/01/01 00:00"), is: Year("2001"), in: .tokyo),
            .date(Date("2001/01/01 00:00"), is: Year("2000"), in: .honolulu),
            .date(Date("2001/01/01 00:00"), is: Year("2001"), in: .amsterdam),
            
            .date(Date("2000/12/31 14:59"), is: Year("2000"), in: .utc),
            .date(Date("2000/12/31 14:59"), is: Year("2000"), in: .tokyo),
            .date(Date("2000/12/31 14:59"), is: Year("2000"), in: .honolulu),
            .date(Date("2000/12/31 14:59"), is: Year("2000"), in: .amsterdam),
            
            .date(Date("2000/12/31 15:00"), is: Year("2000"), in: .utc),
            .date(Date("2000/12/31 15:00"), is: Year("2001"), in: .tokyo),
            .date(Date("2000/12/31 15:00"), is: Year("2000"), in: .honolulu),
            .date(Date("2000/12/31 15:00"), is: Year("2000"), in: .amsterdam),
            
            .date(Date("2000/12/31 10:00"), is: Year("2000"), in: .utc),
            .date(Date("2000/12/31 10:00"), is: Year("2000"), in: .tokyo),
            .date(Date("2000/12/31 10:00"), is: Year("2000"), in: .honolulu),
            .date(Date("2000/12/31 10:00"), is: Year("2000"), in: .amsterdam),
            
            .date(Date("2000/12/31 09:59"), is: Year("2000"), in: .utc),
            .date(Date("2000/12/31 09:59"), is: Year("2000"), in: .tokyo),
            .date(Date("2000/12/31 09:59"), is: Year("2000"), in: .honolulu),
            .date(Date("2000/12/31 09:59"), is: Year("2000"), in: .amsterdam),
            
            .date(Date("2000/12/31 23:00"), is: Year("2000"), in: .utc),
            .date(Date("2000/12/31 23:00"), is: Year("2001"), in: .tokyo),
            .date(Date("2000/12/31 23:00"), is: Year("2000"), in: .honolulu),
            .date(Date("2000/12/31 23:00"), is: Year("2001"), in: .amsterdam),
            
            .date(Date("2000/12/31 22:59"), is: Year("2000"), in: .utc),
            .date(Date("2000/12/31 22:59"), is: Year("2001"), in: .tokyo),
            .date(Date("2000/12/31 22:59"), is: Year("2000"), in: .honolulu),
            .date(Date("2000/12/31 22:59"), is: Year("2000"), in: .amsterdam),
            
            // Auckland
            .date(Date("2000/12/31 10:00"), is: Year("2000"), in: .auckland),
            .date(Date("2000/12/31 11:00"), is: Year("2001"), in: .auckland),
            .date(Date("2000/12/31 12:00"), is: Year("2001"), in: .auckland)
        )
    }
    
    func testDaysAsRangeInMonth() {
        XCTAssertEqual(utc.days(asRangeIn: month_2001_01), day_2001_01_01_mon ..< day_2001_02_02_thu)
    }
    
    func testDaysAsClosedRangeInMonth() {
        XCTAssertEqual(utc.days(asClosedRangeIn: month_2001_01), day_2001_01_01_mon ... day_2001_01_31_wed)
    }
    
    func testDaysAsRangeInYear() {
        XCTAssertEqual(utc.days(asRangeIn: year_2001), day_2001_01_01_mon ..< day_2002_01_01_tue)
    }
    
    func testDaysAsClosedRangeInYear() {
        XCTAssertEqual(utc.days(asClosedRangeIn: year_2001), day_2001_01_01_mon ... day_2001_12_31_mon)
    }
    
    func testMonthsAsRangeInYear() {
        XCTAssertEqual(utc.months(asRangeIn: year_2001), month_2001_01 ..< month_2002_01)
    }
    
    func testMonthsAsClosedRangeInYear() {
        XCTAssertEqual(utc.months(asClosedRangeIn: year_2001), month_2001_01 ... month_2001_12)
    }
    
    func testDateRangeInDay() {
        XCTAssertEqual(utc.dateRange(in: day_2001_01_01_mon), Date("2001/01/01 00:00") ..< Date("2001/01/02 00:00"))
    }
    
    func testDateRangeInDays_Range() {
        XCTAssertEqual(utc.dateRange(in: day_2001_01_01_mon ..< day_2001_01_03_wed), Date("2001/01/01 00:00") ..< Date("2001/01/03 00:00"))
    }
    
    func testDateRangeInDays_ClosedRange() {
        XCTAssertEqual(utc.dateRange(in: day_2001_01_01_mon ... day_2001_01_02_tue), Date("2001/01/01 00:00") ..< Date("2001/01/03 00:00"))
    }
    
    func testDateRangeInMonth() {
        XCTAssertEqual(utc.dateRange(in: month_2001_01), Date("2001/01/01 00:00") ..< Date("2001/02/01 00:00"))
    }
    
    func testDateRangeInMonths_Range() {
        XCTAssertEqual(utc.dateRange(in: month_2001_01 ..< month_2001_01.next.next), Date("2001/01/01 00:00") ..< Date("2001/03/01 00:00"))
    }
    
    func testDateRangeInMonths_ClosedRange() {
        XCTAssertEqual(utc.dateRange(in: month_2001_01 ... month_2001_01.next), Date("2001/01/01 00:00") ..< Date("2001/03/01 00:00"))
    }
    
    func testDateRangeInYear() {
        XCTAssertEqual(utc.dateRange(in: year_2001), Date("2001/01/01 00:00") ..< Date("2002/01/01 00:00"))
    }
    
    func testDateRangeInYears_Range() {
        XCTAssertEqual(utc.dateRange(in: year_2001 ..< year_2001.next.next), Date("2001/01/01 00:00") ..< Date("2003/01/01 00:00"))
    }
    
    func testDateRangeInYears_ClosedRange() {
        XCTAssertEqual(utc.dateRange(in: year_2001 ... year_2001.next), Date("2001/01/01 00:00") ..< Date("2003/01/01 00:00"))
    }
    
    // MARK: - Helper
    
    struct TestCase {
        
        let execute: () -> Void
        
        static func date(_ date: Date, is day: Day, in calendar: Calendar, file: StaticString = #file, line: UInt = #line) -> TestCase {
            return TestCase {
                XCTAssertEqual(calendar.day(for: date), day, file: file, line: line)
            }
        }
        
        static func date(_ date: Date, is month: Month, in calendar: Calendar, file: StaticString = #file, line: UInt = #line) -> TestCase {
            return TestCase {
                XCTAssertEqual(calendar.month(for: date), month, file: file, line: line)
            }
        }
        
        static func date(_ date: Date, is year: Year, in calendar: Calendar, file: StaticString = #file, line: UInt = #line) -> TestCase {
            return TestCase {
                XCTAssertEqual(calendar.year(for: date), year, file: file, line: line)
            }
        }
        
        static func startDate(of day: Day, is date: Date, in calendar: Calendar, file: StaticString = #file, line: UInt = #line) -> TestCase {
            return TestCase {
                XCTAssertEqual(calendar.startDate(of: day), date, file: file, line: line)
            }
        }
        
        static func startDate(of month: Month, is date: Date, in calendar: Calendar, file: StaticString = #file, line: UInt = #line) -> TestCase {
            return TestCase {
                XCTAssertEqual(calendar.startDate(of: month), date, file: file, line: line)
            }
        }
        
        static func startDate(of year: Year, is date: Date, in calendar: Calendar, file: StaticString = #file, line: UInt = #line) -> TestCase {
            return TestCase {
                XCTAssertEqual(calendar.startDate(of: year), date, file: file, line: line)
            }
        }
    }
    
    func runTestCases(_ testCases: TestCase...) {
        testCases.forEach { $0.execute() }
    }
}

extension CalendarTests {
    
    func testChinense() {
        let chinese = Calendar.chinese
        let gregorian_2000_12_26 = Day(intervalSinceReferenceDate: -6) // "2000/12/26" in gregorian is "0017/12/01" in chinese
        let gregorian_2000_02_05 = Day(intervalSinceReferenceDate: -331) // "2000/02/05" in gregorian is "0017/01/01" in chinese
        
        XCTAssertEqual(chinese.firstDay(of: month_2001_01), gregorian_2000_12_26)
        XCTAssertEqual(chinese.firstDay(of: year_2001), gregorian_2000_02_05)
        XCTAssertEqual(chinese.isFirstDayOfMonth(gregorian_2000_12_26), true)
        
        XCTAssertEqual(chinese.startDate(of: month_2001_01), Date("2000/12/26 00:00"))
        XCTAssertEqual(chinese.startDate(of: year_2001), Date("2000/02/05 00:00"))
    }
}
