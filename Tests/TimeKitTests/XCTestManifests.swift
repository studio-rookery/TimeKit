import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CalendarTests.allTests),
        testCase(IntTests.allTests),
        testCase(WeekdayTests.allTests),
        testCase(DayTests.allTests),
    ]
}
#endif
