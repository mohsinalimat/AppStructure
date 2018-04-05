//
//  UserLoader.swift
//  AppStructure
//
//  Created by Fahid Attique on 10/25/17.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import Foundation
import ObjectMapper



class UserLoader {
    
    
    // MARK: - Network Manager
    
    fileprivate let manager = NetworkManager()
    
    
    
    
    
    // MARK: - API Call Methods related to User

    func getCountriesList(successBlock success: @escaping ((_ countryList:[Country]) -> Void), failureBlock failure: @escaping ((_ error: NSError?) -> Void)) {
        
        let service = Endpoint.countryList
        _ = manager.request(.get, service: service, parameters: nil, authorized: false, success: { (response, json) in
          
            guard let dataInfo = json.data as? [String : Any] else {
                failure(NSError(errorMessage: "Data key is not coming from server"))
                return
            }

            let countries = Mapper<Country>(context: service).mapArray(JSONObject: dataInfo)
            success(countries!)
            
        }, failure: failure)
    }
    
}
