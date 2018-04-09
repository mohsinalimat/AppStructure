//
//  DataType+Currency.swift
//  AppStructure
//
//  Created by Fahid Attique on 19/02/2018.
//  Copyright © 2018 Fahad Attique. All rights reserved.
//

import Foundation


extension Double {
    
    var toDollars: String {
        get {
            return "$" + String(format: "%.2f", self)
        }
    }
}



extension String {
    
    var toDollars: String {
        get {
            return "$" + String(format: "%.2f", self.doubleValue)
        }
    }
    
    var doubleValue: Double {
        get {
            return (self as NSString).doubleValue
        }
    }
    
}
