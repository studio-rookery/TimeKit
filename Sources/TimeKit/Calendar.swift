//
//  Calendar.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

private extension Calendar {
    
    var secondsFromGMT: TimeInterval {
        return TimeInterval(timeZone.secondsFromGMT())
    }
    
    func startDateComponents(_ component: Component, for date: Date) -> DateComponents {
        let truncated = dateInterval(of: component, for: date)!.start + secondsFromGMT
        return dateComponents([component], from: .referenceDate, to: truncated)
    }
    
    func startDate<T: ReferenceDateStrideable>(of component: Component, for value: T) -> Date {
        let date = self.date(byAdding: component, value: value.intervalSinceReferenceDate, to: .referenceDate)!
        return date - secondsFromGMT
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
    
    /// Returns a first Day of a given Year.
    ///
    /// - Parameter year: the year to search.
    /// - Returns: a first Day of a given Year.
    func firstDay(of year: Year) -> Day {
        return day(for: startDate(of: year))
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
        let weekday = dateComponents([.weekday], from: date).weekday! - 1
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
