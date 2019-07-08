//
//  Int+Extension.swift
//  TimeKitTests
//
//  Created by hirano masaki on 2019/01/23.
//

import Foundation

extension TimeInterval {
    
    var seconds: TimeInterval {
        return self
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
