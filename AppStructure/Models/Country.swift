//
//  Country.swift
//  AppStructure
//
//  Created by Fahid Attique on 10/25/17.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import Foundation
import ObjectMapper



class Country: NSObject, Mappable {
    
    var conuntryId:NSNumber = 0
    var name: String = ""
    var dialCode: String = ""
    var ISOCode: String = ""
    var flagUrl: String = ""
    
    
    
    // MARK:- Overidden Methods
    
    override init() {
        super.init()
    }
    
    
    // MARK:- Mappable Method
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        
        ISOCode <- map["iso_3166_2"]
        name <- map["name"]
        dialCode <- map["calling_code"]
        flagUrl <- map["flag"]
    }
    
}

