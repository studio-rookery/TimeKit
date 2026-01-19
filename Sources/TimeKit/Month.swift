//
//  Month.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

/// `Month` is a unit of time representing month without a TimeZone.
public struct Month: Hashable, Codable, ReferenceDateStrideable {
    
    public struct Components: Hashable, Codable {
        
        public var year: Int
        public var month: Int
        
        public init(year: Int, month: Int) {
            self.year = year
            self.month = month
        }
        
        public init?(dateComponents: DateComponents) {
            guard let year = dateComponents.year, let month = dateComponents.month else {
                return nil
            }
            self.year = year
            self.month = month
        }
    }
    
    public var intervalSinceReferenceDate: Int
    
    public init(intervalSinceReferenceDate: Int) {
        self.intervalSinceReferenceDate = intervalSinceReferenceDate
    }
    
    public var referenceMonth: Month {
        Month(intervalSinceReferenceDate: 0)
    }
}

extension Month: CustomStringConvertible {
    
    public var description: String {
        return "\(DateFormatter.monthFormatter.string(from: self)) in gregorian calendar"
    }
}
