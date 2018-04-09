//
//  String+Additions.swift
//  AppStructure
//
//  Created by Fahid Attique on 15/01/2018.
//  Copyright © 2018 Fahad Attique. All rights reserved.
//


import Foundation

extension String {
    var length: Int { return characters.count}
    
    mutating func removeFirstCharacter() -> Character {
        return remove(at: startIndex)
    }
    
    func characterAtIndex(_ index: Int) -> Character {
        return self[characters.index(startIndex, offsetBy: index)]
    }
    
    mutating func insertCharacter(_ character: Character, atIndex index: Int) -> () {
        
        guard index < length else { return }
        
        insert(character, at: self.index(startIndex, offsetBy: 4))
    }
    
    func dateFromString(_ pattern:String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = pattern
        return dateFormatter.date(from: self)
    }
    
    
    
    func isEmail() -> Bool
    {
        let EMAIL_REGEX = "^([^@\\s]+)@((?:[-a-z0-9]+\\.)+[a-z]{2,})$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", EMAIL_REGEX)
        return predicate.evaluate(with: self)
    }

}
