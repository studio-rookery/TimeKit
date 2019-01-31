//
//  DateFormatter.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/31.
//

import Foundation

internal extension DateFormatter {
    
    static func makeDateFormatter(dateFormat: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = .utc
        dateFormatter.timeZone = Calendar.utc.timeZone
        dateFormatter.locale = Calendar.utc.locale
        dateFormatter.dateFormat = dateFormat
        return dateFormatter
    }
    
    static let dayFormatter = makeDateFormatter(dateFormat: "yyyy-MM-dd(EE)")
    static let monthFormatter = makeDateFormatter(dateFormat: "yyyy-MM")
    static let yearFormatter = makeDateFormatter(dateFormat: "yyyy")
}
