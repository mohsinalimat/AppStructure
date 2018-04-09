//
//  NSArray+Additions.swift
//  Lango
//
//  Created by Asif Bilal on 01/08/2016.
//  Copyright © 2016 Asif Bilal. All rights reserved.
//

import Foundation

extension Array {

    mutating func removeObject<T: Equatable> (_ objet: T) -> Bool {
        
        for (idx, objectToCompare) in self.enumerated() {
            if let to = objectToCompare as? T {
                if objet == to {
                    self.remove(at: idx)
                    return true
                }
            }
        }
        return false
    }
}

