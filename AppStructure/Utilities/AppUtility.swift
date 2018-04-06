//
//  AppDataManager.swift
//  LanguageParrot
//
//  Created by Fahid Attique on 01/08/2016.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import Photos


class AppUtility: NSObject {
    

    // MARK: - Static
    
    static let sharedInstance = AppUtility()
    
    
    
    
    

    
    
    // MARK: - Life Cycle

    override init() {
        super.init()
    }
    

    
    

    
    
    
    // MARK: - Class Properties
    
    fileprivate var _appAuthToken:String?
    var appAuthToken:String? {
        get {
            if _appAuthToken == nil { _appAuthToken = userDefaults.object(forKey: keyAuthToken) as? String}
            return _appAuthToken
        }
        
        set {
            if _appAuthToken != newValue {
                _appAuthToken = newValue
                userDefaults.set(_appAuthToken, forKey:keyAuthToken)
            }
        }
    }
    
    fileprivate var _activeUser:User?
    var activeUser:User? {
        get {
            if _activeUser == nil { _activeUser = User.getCurrentUser()}
            return _activeUser
        }
        
        set {
            if _activeUser != newValue {
                _activeUser = newValue
            }
        }
    }
    

    
    
    
    

    

    
    // MARK: - Functions

    func logoutAppUser() {
        
        User.logoutUser()
//        docsHelper.clearAllFiles()
        appAuthToken = nil
        
//        showRegisterView(true)
    }
    

    
    func handleTokenError(_ errorMessage: String) {
        
        let topViewController = UIViewController.topViewController()!
        
        let alertViewTag = 2001
        
        if topViewController is UIAlertController && topViewController.view.tag == alertViewTag {
            //Token Error Alert is already displayed. So, no need to display it agai.
            return
        }
        
        _ = ProgressHud.hideHUDForView(topViewController.view)
        
        let alertViewController = Utility.showAlert(errorMessage, message: "", buttonsDictionary: [buttonOK: {(alertAction) in
            appUtility.logoutAppUser()
            }], baseController: topViewController)
        
        alertViewController.view.tag = alertViewTag
    }

    func handleUserBlockedError(_ errorMessage: String) {
        
        let topViewController = UIViewController.topViewController()!
        
        let alertViewTag = 2002
        
        if topViewController is UIAlertController && topViewController.view.tag == alertViewTag {
            //Token Error Alert is already displayed. So, no need to display it again.
            return
        }
        
        _ = ProgressHud.hideHUDForView(topViewController.view)
        let alertViewController = Utility.showAlert(errorMessage, message: "", buttonsDictionary: [buttonOK: {(alertAction) in
            appUtility.logoutAppUser()
            }], baseController: topViewController)
        
        alertViewController.view.tag = alertViewTag
    }


    func handleForceUpdate(_ message: String) {
        
        let topViewController = UIViewController.topViewController()!
        
        let alertViewTag = 2004
        
        if topViewController is UIAlertController && topViewController.view.tag == alertViewTag {
            //Token Error Alert is already displayed. So, no need to display it agai.
            return
        }
        
        _ = ProgressHud.hideHUDForView(topViewController.view)
        
        let alertViewController = Utility.showAlert("Get our latest app", message: message, buttonsDictionary: [buttonGoToAppstore: {(alertAction) in
            
            if let url = URL(string: appstoreURL),
                UIApplication.shared.canOpenURL(url){
                UIApplication.shared.openURL(url)
            }
            
            }], baseController: topViewController)
        
        alertViewController.view.tag = alertViewTag
    }

    
    
    func parseUserResponse(_ userInfo:[String: AnyObject], context: MapContext) -> User {
        
        let user = Mapper<User>(context: context).map(JSON: userInfo)
        _ = user?.saveUser()
        return user!
    }

    
    
    

    
    
    
    
    //  MARK: - Utility Functions
    
    func callNumber( _ phoneNumber:String) {
        
        if let url = URL(string: "tel://\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

}









extension AppUtility {
    
    
    func imageFrom(asset:PHAsset, size:CGSize, success:@escaping (_ photo:UIImage)->Void){
        
        let options = PHImageRequestOptions()
        options.isSynchronous = false
        options.deliveryMode = .highQualityFormat
        PHImageManager.default().requestImage(for: asset, targetSize: size, contentMode: .aspectFill, options: options, resultHandler: { (image, attributes) in
            let photo = image ?? #imageLiteral(resourceName: "placeholderImage")
            success(photo)
        })
    }
}


