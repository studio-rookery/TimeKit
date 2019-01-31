//
//  Year.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

/// `Day` is a unit of time representing Year without a TimeZone.
public struct Year: Hashable, Codable, ReferenceDateStrideable {
    
    public var intervalSinceReferenceDate: Int
    
    public init(intervalSinceReferenceDate: Int) {
        self.intervalSinceReferenceDate = intervalSinceReferenceDate
    }
}

extension Year: CustomStringConvertible {
    
    public var description: String {
        return "\(DateFormatter.yearFormatter.string(from: self)) in gregorian calendar"
    }
}
