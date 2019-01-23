//
//  Int+Extension.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

extension Int {
    
    private var timeInterval: TimeInterval {
        return TimeInterval(self)
    }
    
    var seconds: TimeInterval {
        return timeInterval
    }
    
    var minutes: TimeInterval {
        return 60 * seconds
    }
    
    var hour: TimeInterval {
        return 60 * minutes
    }
    
    var day: TimeInterval {
        return 24 * hour
    }
}
