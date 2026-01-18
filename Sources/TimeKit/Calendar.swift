//
//  Calendar.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

extension Calendar {

    /// gregorian calendar +00:00
    static internal let utc: Calendar = {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        return calendar
    }()
}

private extension Calendar {
    
    func baseDate() -> Date {
        let referenceDate = Date.referenceDate
        let offset = TimeInterval(timeZone.secondsFromGMT(for: referenceDate))
        return referenceDate.addingTimeInterval(-offset)
    }
    
    func startDateComponents(_ component: Component, for date: Date) -> DateComponents {
        dateComponents([component], from: baseDate(), to: dateInterval(of: component, for: date)!.start)
    }
    
    func startDate<T: ReferenceDateStrideable>(of component: Component, for value: T) -> Date {
        let date = baseDate()
        let startDate = dateInterval(of: component, for: date)!.start
        return self.date(byAdding: component, value: value.intervalSinceReferenceDate, to: startDate)!
    }
}

// MARK: - Date

public extension Calendar {
    
    /// Returns first moment of a given Day, as a Date
    ///
    /// - Parameter day: the day to search.
    /// - Returns: first moment of a given Day.
    func startDate(of day: Day) -> Date {
        return startDate(of: .day, for: day)
    }
    
    /// Returns first moment of a given Month, as a Date
    ///
    /// - Parameter month: the month to search.
    /// - Returns: first moment of a given Month.
    func startDate(of month: Month) -> Date {
        return startDate(of: .month, for: month)
    }
    
    /// Returns first moment of a given Year, as a Date
    ///
    /// - Parameter year: the year to search.
    /// - Returns: first moment of a given Year.
    func startDate(of year: Year) -> Date {
        return startDate(of: .year, for: year)
    }
}

// MARK: - Day

public extension Calendar {
    
    /// Returns a Day containing a given Date.
    ///
    /// - Parameter date: the date to search.
    /// - Returns: a Day containing a given Date.
    func day(for date: Date) -> Day {
        let interval = startDateComponents(.day, for: date).day!
        return Day(intervalSinceReferenceDate: interval)
    }
    
    /// Returns a first Day of a given Month.
    ///
    /// - Parameter month: the month to search.
    /// - Returns: a first Day of a given Month.
    func firstDay(of month: Month) -> Day {
        return day(for: startDate(of: month))
    }
    
    /// Returns a last Day of a given Month.
    ///
    /// - Parameter month: the month to search.
    /// - Returns: a last Day of a given Month.
    func lastDay(of month: Month) -> Day {
        return firstDay(of: month.next).previous
    }
    
    /// Returns a first Day of a given Year.
    ///
    /// - Parameter year: the year to search.
    /// - Returns: a first Day of a given Year.
    func firstDay(of year: Year) -> Day {
        return day(for: startDate(of: year))
    }
    
    /// Returns a last Day of a given Year.
    ///
    /// - Parameter year: the year to search.
    /// - Returns: a last Day of a given Year.
    func lastDay(of year: Year) -> Day {
        return firstDay(of: year.next).previous
    }
    
    /// Returns a Boolean value indicating whether a given day is beginning of month.
    ///
    /// - Parameter day: the day to search.
    /// - Returns: true if the day is beginning of month; otherwise, false.
    func isFirstDayOfMonth(_ day: Day) -> Bool {
        return firstDay(of: month(for: day)) == day
    }
}

// MARK: - Month

public extension Calendar {
    
    /// Returns a Month containing a given Date.
    ///
    /// - Parameter date: the date to search.
    /// - Returns: Month containing a given Date.
    func month(for date: Date) -> Month {
        let interval = startDateComponents(.month, for: date).month!
        return Month(intervalSinceReferenceDate: interval)
    }
    
    /// Returns a Month containing a given Day.
    ///
    /// - Parameter day: the day to search.
    /// - Returns: a Month containing a given Day.
    func month(for day: Day) -> Month {
        return month(for: startDate(of: day))
    }
    
    /// Returns a first Month of a given Year.
    ///
    /// - Parameter year: the year to search.
    /// - Returns: a first Month of a given Year.
    func firstMonth(of year: Year) -> Month {
        return month(for: startDate(of: year))
    }
    
    /// Returns a last Month of a given Year.
    ///
    /// - Parameter year: the year to search.
    /// - Returns: a last Month of a given Year.
    func lastMonth(of year: Year) -> Month {
        return firstMonth(of: year.next).previous
    }
}

// MARK: - Year

public extension Calendar {
    
    /// Returns a Year containing a given Date.
    ///
    /// - Parameter date: the date to search.
    /// - Returns: a Year containing a given Date.
    func year(for date: Date) -> Year {
        let interval = startDateComponents(.year, for: date).year!
        return Year(intervalSinceReferenceDate: interval)
    }
    
    /// Returns a Year containing a given Day.
    ///
    /// - Parameter day: the day to search.
    /// - Returns: a Year containing a given Day.
    func year(for day: Day) -> Year {
        return year(for: startDate(of: day))
    }
    
    /// Returns a Year containing a given Month.
    ///
    /// - Parameter month: the month to search.
    /// - Returns: a Year containing a given Month.
    func year(for month: Month) -> Year {
        return year(for: startDate(of: month))
    }
}

// MARK: - WeekDay

public extension Calendar {
    
    /// Returns a Weekday for a given Date.
    ///
    /// - Parameter date: the date to search.
    /// - Returns: a Weekday for a given Date.
    func weekday(for date: Date) -> Weekday {
        let weekday = dateComponents([.weekday], from: date).weekday!
        return Weekday(rawValue: weekday)
    }
    
    /// Returns a Weekday for a given Day.
    ///
    /// - Parameter day: the day to search.
    /// - Returns: a Weekday for a given Day.
    func weekday(for day: Day) -> Weekday {
        return weekday(for: startDate(of: day))
    }
    
    /// Returns a last day of a given weekday before a given Day.
    ///
    /// - Parameters:
    ///   - weekday: the specified weekday.
    ///   - day: the specified day.
    /// - Returns: a last day of a given weekday before a given Day.
    func previous(_ weekday: Weekday, before day: Day) -> Day {
        let weekdayOfDay = self.weekday(for: day)
        let distance = weekdayOfDay.distance(toPrevious: weekday)
        return day.advanced(by: distance)
    }
    
    /// Returns a next day of a given weekday after a given Day.
    ///
    /// - Parameters:
    ///   - weekday: the specified weekday.
    ///   - day: the specified day.
    /// - Returns: a next day of a given weekday after a given Day.
    func next(_ weekday: Weekday, after day: Day) -> Day {
        let weekdayOfDay = self.weekday(for: day)
        let distance = weekdayOfDay.distance(toNext: weekday)
        return day.advanced(by: distance)
    }
    
    /// Returns a last day of a given weekday on or before a given Day.
    ///
    /// - Parameters:
    ///   - weekday: the specified weekday.
    ///   - day: the specified day.
    /// - Returns: a last day of a given weekday on or before a given Day.
    func previous(_ weekday: Weekday, onOrBefore day: Day) -> Day {
        if self.weekday(for: day) == weekday {
            return day
        } else {
            return previous(weekday, before: day)
        }
    }
    
    /// Returns a next day of a given weekday on or after a given Day.
    ///
    /// - Parameters:
    ///   - weekday: the specified weekday.
    ///   - day: the specified day.
    /// - Returns: a next day of a given weekday on or after a given Day.
    func next(_ weekday: Weekday, onOrAfter day: Day) -> Day {
        if self.weekday(for: day) == weekday {
            return day
        } else {
            return next(weekday, after: day)
        }
    }
}

// MARK: - Range / ClosedRange

public extension Calendar {
    
    /// Returns the range of days in a given month as a half-open range.
    ///
    /// The returned range is `[firstDay, dayAfterLastDay)`, which is convenient for iteration and
    /// filtering with `>= start && < end`.
    ///
    /// - Parameter month: the month to search.
    /// - Returns: a half-open range of days in the month.
    func days(asRangeIn month: Month) -> Range<Day> {
        firstDay(of: month) ..< lastDay(of: month).next
    }
    
    /// Returns the range of days in a given month as a closed range.
    ///
    /// The returned range includes both the first and the last day of the month.
    ///
    /// - Parameter month: the month to search.
    /// - Returns: a closed range of days in the month.
    func days(asClosedRangeIn month: Month) -> ClosedRange<Day> {
        firstDay(of: month) ... lastDay(of: month)
    }
    
    /// Returns the range of days in a given year as a half-open range.
    ///
    /// The returned range is `[firstDay, dayAfterLastDay)`, which is convenient for iteration and
    /// filtering with `>= start && < end`.
    ///
    /// - Parameter year: the year to search.
    /// - Returns: a half-open range of days in the year.
    func days(asRangeIn year: Year) -> Range<Day> {
        firstDay(of: year) ..< lastDay(of: year).next
    }
    
    /// Returns the range of days in a given year as a closed range.
    ///
    /// The returned range includes both the first and the last day of the year.
    ///
    /// - Parameter year: the year to search.
    /// - Returns: a closed range of days in the year.
    func days(asClosedRangeIn year: Year) -> ClosedRange<Day> {
        firstDay(of: year) ... lastDay(of: year)
    }
    
    /// Returns the range of months in a given year as a half-open range.
    ///
    /// The returned range is `[firstMonth, monthAfterLastMonth)`, which is convenient for iteration and
    /// filtering with `>= start && < end`.
    ///
    /// - Parameter year: the year to search.
    /// - Returns: a half-open range of months in the year.
    func months(asRangeIn year: Year) -> Range<Month> {
        firstMonth(of: year) ..< lastMonth(of: year).next
    }
    
    /// Returns the range of months in a given year as a closed range.
    ///
    /// The returned range includes both the first and the last month of the year.
    ///
    /// - Parameter year: the year to search.
    /// - Returns: a closed range of months in the year.
    func months(asClosedRangeIn year: Year) -> ClosedRange<Month> {
        firstMonth(of: year) ... lastMonth(of: year)
    }
}
