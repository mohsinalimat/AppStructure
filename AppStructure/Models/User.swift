//
//  User.swift
//  AppStructure
//
//  Created by Fahid Attique on 10/25/17.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import Foundation

class User {
    var name : String?
    var description  : String?
    
    init(data: [String:String]? ) {
        
        self.name = data?["name"] ?? ""
        self.description = data?["description"]   ?? ""
    }
    
}
