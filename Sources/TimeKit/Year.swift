//
//  Year.swift
//  TimeKit
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

/// `Year` is a unit of time representing year without a TimeZone.
public struct Year: Hashable, Codable, ReferenceDateStrideable {
    
    public struct Components: Hashable, Codable {
        
        public var year: Int
        
        public init(year: Int) {
            self.year = year
        }
        
        public init?(dateComponents: DateComponents) {
            guard let year = dateComponents.year else {
                return nil
            }
            self.year = year
        }
    }
    
    public var intervalSinceReferenceDate: Int
    
    public init(intervalSinceReferenceDate: Int) {
        self.intervalSinceReferenceDate = intervalSinceReferenceDate
    }
    
    public var referenceYear: Year {
        Year(intervalSinceReferenceDate: 0)
    }
}

extension Year: CustomStringConvertible {
    
    public var description: String {
        return "\(DateFormatter.yearFormatter.string(from: self)) in gregorian calendar"
    }
}
