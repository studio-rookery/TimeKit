//
//  Int+Extension.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

public extension Int {
    
    /// Creates Array of days starting from a given day.
    ///
    /// - Parameter day: start of array.
    /// - Returns: Array of days starting from a given day.
    func days(from day: Day) -> [Day] {
        return array(from: day, advancing: self)
    }
    
    /// Creates Array of months starting from a given month.
    ///
    /// - Parameter month: start of array.
    /// - Returns: Array of months starting from a given month.
    func months(from month: Month) -> [Month] {
        return array(from: month, advancing: self)
    }
    
    /// Creates Array of years starting from a given day.
    ///
    /// - Parameter year: start of array.
    /// - Returns: Array of years starting from a given year.
    func years(from year: Year) -> [Year] {
        return array(from: year, advancing: self)
    }
    
    private func array<S: Strideable>(from source: S, advancing: Int) -> [S] where S.Stride == Int {
        guard advancing != 0 else {
            return []
        }
        if advancing > 0 {
            return (0..<advancing).map(source.advanced(by: ))
        } else {
            return ((advancing + 1)...0).map(source.advanced(by: ))
        }
    }
}
