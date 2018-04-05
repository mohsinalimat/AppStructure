//
//  NetworkManager.swift
//  AppStructure
//
//  Created by Fahid Attique on 10/25/17.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import Foundation




// Create an Enum named as Endpoint to add app specific end points. Conform it with Directable to make directable urls.

enum Endpoint: Directable {
    
    
    // MARK: - Endpoints
    
    case countryList
    
    
    

    
    // MARK: - Directable Endpoint Urls

    func directableURLString() -> String {
        
        var servicePath = ""
        
        switch (self) {
            
        case .countryList:
            servicePath = "get-countries-data"
            
        }
        
        let tail = "api"
        return baseUrl + "/" + tail + "/" + servicePath
    }
}










/// Service Manager of application
///
/// - Usage:
///     - Must implement the *authorizationHeadersIf* method to send headers to your server
///     - Must implement the *handleServerError* method to validate the error from your server



class NetworkManager: Routable {
    
    
    
    
    func authorizationHeadersIf(_ authorized: Bool) -> [String : String]? {
        
        var headers:[String: String]? = nil
        headers = [String : String]()
//        if authorized {headers = ["Authorization": "Bearer \("appUtility.appAuthToken!")"]}
//        headers!["platform"] = "ios"
//        headers!["app-version"] = "1.4.2"
        
        return headers
    }
    
    
    
    
    
    
    func handleServerError(_ result: DataResponse<JSONTopModal>, failure: FailureErrorBlock!) -> Bool {
        
        let resultValue = result.value!
        if resultValue.isError {
            
            //            if resultValue.statusCode == loggedInAnotherDeviceErrorCode {
            //                handleTokenError(resultValue.message)
            //            }
            //            else {
            failure(NSError(errorMessage: resultValue.message, code: resultValue.statusCode))
            //            }
            
            return true
        }
        return false
    }
}

