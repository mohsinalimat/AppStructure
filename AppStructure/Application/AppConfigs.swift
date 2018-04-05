//
//  AppConfig.swift
//  AppStructure
//
//  Created by Fahid Attique on 10/25/17.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import Foundation



enum AppMode: Int {
    case local = 0, dev, staging, production
}






var appMode: AppMode {
    return .dev
}







var baseUrl: String {
    
    var baseUrl = ""
    
    switch appMode {

    case .local:
        baseUrl = "http://10.28.83.70:8000/"

    case .dev:
        baseUrl = "https://languagevalet.vteamslabs.com"

    case .staging:
        baseUrl = ""

    case .production:
        baseUrl = ""
    }
    
    return baseUrl
}

