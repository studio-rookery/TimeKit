//
//  Date+Extension.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

public extension Date {
    
    /// 00:00:00 UTC on 1 January 2001.
    /// TimeKit uses this for computing date components.
    static let referenceDate = Date(timeIntervalSinceReferenceDate: 0)
}
