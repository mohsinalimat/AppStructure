//
//  Date+Additions.swift
//  AppStructure
//
//  Created by Fahid Attique on 28/01/2018.
//  Copyright © 2018 Fahad Attique. All rights reserved.
//

import Foundation

extension Date {
    
    static var timeStampInMillis: Int64 {
        return Int64(Date().timeIntervalSince1970)
    }

    static var timeStampInMillisString: String {
        return String(timeStampInMillis)
    }

}










public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs === rhs || lhs.compare(rhs as Date) == .orderedSame
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedAscending
}

public func >(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedDescending
}

extension NSDate: Comparable { }
