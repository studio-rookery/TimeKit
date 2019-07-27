# TimeKit

[![Build Status](https://travis-ci.org/studio-rookery/TimeKit.svg?branch=master)](https://travis-ci.org/studio-rookery/TimeKit) [![codecov](https://codecov.io/gh/studio-rookery/TimeKit/branch/master/graph/badge.svg)](https://codecov.io/gh/studio-rookery/TimeKit) [![SwiftPM](https://img.shields.io/badge/SwiftPM-compatible-brightgreen.svg)](https://github.com/apple/swift-package-manager) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/studio-rookery/TimeKit) [![Version](https://img.shields.io/cocoapods/v/TimeKit.svg?style=flat)](http://cocoadocs.org/docsets/TimeKit) [![Platform](https://img.shields.io/cocoapods/p/TimeKit.svg?style=flat)](http://cocoadocs.org/docsets/TimeKit)

TimeKit is a type safe, simple, lightweight date components.

```swift
let calendar = Calendar.utc

// 1970/01/01(thu) 00:00 +00:00
let date = Date(timeIntervalSince1970: 0)

// TimeKit provides date components: `Day`, `Month`, `Year`, `Weekday`.
// These are compatible with `Date`.
let day = calendar.day(for: date)
let month = calendar.month(for: date)
let year = calendar.year(for: date)
let weekday = day.weekday
```

`Day`, `Month`, `Year`, `Weekday` are independent of a particular calendar or time zone.
To represent these components to a user, you must interpret them in the context of a `Calendar`.

```swift
let inUTC = Calendar.utc.startDate(of: day)           // 1970/01/01(thu) 00:00 +00:00
let inTokyo = Calendar.tokyo.startDate(of: day)       // 1970/01/01(thu) 09:00 +00:00
let inHonolulu = Calendar.honolulu.startDate(of: day) // 1969/12/31(wed) 14:00 +00:00
```

## Usage

### Convert Date to `Day`, `Month`, `Year`
```swift
let calendar = Calendar.utc
let date = Date(timeIntervalSince1970: 0)

let day = calendar.day(for: date)
let month = calendar.month(for: date)
let year = calendar.year(for: date)
```

The date components are independent of a particular calendar or time zone.
You need a `Calendar` to convert them from Date.

### Convert `Day`, `Month`, `Year` to Date
```swift
let startOfDay = calendar.start(of: day)
let startOfMonth = calendar.start(of: month)
let startOfYear = calendar.start(of: year)
```
For the same reason as above, you need a `Calendar` to convert to Date from the date components.

### Manipulation

```swift
// A day after / before `today`
let tomorrow = day.next
let yesterday = day.previous

// Addition and subtraction
let threeDaysLater = day + 3.day
let fourMonthsAgo = month - 4.month
let fiveYearsLater = year + 5.year

// Obtain the date components range
let days = 42.days(from: today)     // ["1970/01/01", "1970/01/02", "1970/01/03", ...]
let months = 12.months(from: month) // ["1970/01", "1970/02", "1970/03", ...]
let years = 3.years(from: year)     // ["1970", "1971", "1972"]
```

### Date Formatting

```swift
let dateFormatter = ...

let dayString = dateFormatter.string(from: day)
print(dayString) // => "1970/01/01(thu)"

let day = dateFormatter.day(from: "1970/01/01(thu)")
print(day) // => "1970/01/01(thu) in gregorian calendar"
```

## Requirements

|Name|Version|
|:-:|:-:|
|Xcode|10.2+|
|Swift|5.0+|
|iOS|10.0+|
|macOS|10.12+|
|tvOS|10.0+|
|watchOS|3.0+|

## Installation

### CocoaPods
```
pod 'TimeKit'
```

### Carthage
```
github "studio-rookery/TimeKit"
```

### Swift Package Manager
```
.package(url: "https://github.com/studio-rookery/TimeKit", from: "1.2.0")
```
