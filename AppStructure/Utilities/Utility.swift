//
//  Utility.swift
//  LanguageParrot
//
//  Created by Fahid Attique on 01/08/2016.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit
import RNNotificationView

let rootViewController = UIViewController.topViewController()!

class Utility:NSObject {
    
    
    // MARK:- Alert Messages
    
    static func showAlert(_ error:NSError, onController parentVC: UIViewController = rootViewController) {
        showCancelTypeAlert("", message: error.localizedDescription, buttonTitle: buttonOK, onController: parentVC)
    }
    
    static func showAlert(_ title: String, message: String, onController parentVC: UIViewController = rootViewController) {
        showCancelTypeAlert(title, message: message, buttonTitle: buttonOK, onController: parentVC)
    }
    
    static func showCancelTypeAlert(_ title: String!, message: String!, buttonTitle bTitle: String, onController parentVC: UIViewController!) {
        showCancelTypeAlert(title, message: message, buttonTitle: bTitle, buttonAction: {(alertAction) in}, onController: parentVC)
    }
    
    static func showCancelTypeAlert(_ title: String!, message: String!, buttonTitle bTitle: String, buttonAction bAction: ((UIAlertAction?) -> Void)!, onController parentVC: UIViewController!) {
        _ = showAlert(title, message: message, buttonsDictionary: ["": {($0)}, bTitle: bAction], baseController: parentVC)
    }
    

    
    // MARK:- Helping Methods
    
    /**
     * shows alert to any controller with
     * title, message and a dictionary for button with value of closures and with button titles in key
     * Cancel button should be on second index
     * 1st Index is for default button
     * from third to onward are destructive buttons with red colours
     * to skip any index use this key/value:  "": {($0)}
     */
    static func showAlert(_ title: String?, message: String?, buttonsDictionary buttons: Dictionary<String, (UIAlertAction?) -> Void>!, baseController parentVC: UIViewController!, preferredStyle: UIAlertControllerStyle = .alert) -> UIAlertController {
        
        let alertController: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        var count: Int = 0
        for (bTitle, bAction) in buttons {
            if bTitle != "" {
                var style: UIAlertActionStyle = UIAlertActionStyle.destructive
                if count > 1 {
                    style = UIAlertActionStyle.destructive
                } else if count == 1 {
                    style = UIAlertActionStyle.default
                } else {
                    style = UIAlertActionStyle.cancel
                }
                
                let alertAction: UIAlertAction = UIAlertAction(title: bTitle, style: style, handler: bAction)
                alertController.addAction(alertAction)
            }
            count += 1
        }
        parentVC.present(alertController, animated: true, completion: nil)
        
        return alertController
    }
    
    static func openURL(_ urlString:String) -> Bool {
        
        if urlString.count == 0 {
            QL1("The URL provided is empty.")
            return false
        }
        
        guard let url = URL(string: urlString) else {
            QL1("Could not create the NSURL for" + urlString)
            return false
        }
        
        if !application.canOpenURL(url) {
            QL1("Could not open the NSURL for" + urlString)
            return false
        }
        
        application.openURL(url)
        return true
        
    }
    
    static func showNotification(_ title:String, _ message:String){
        RNNotificationView.sharedNotification.show(withImage: UIImage(named: ""), title: title, message: message, duration: 5,iconSize: CGSize(width: 45, height: 45), onTap: nil)
    }
}











// MARK:- General functions

func isEmpty(_ text:String?) -> Bool
{
    if text == nil {return true}
    if text!.isEmpty == true {return true}
    return false
}

func isEmail(_ text:String?) -> Bool
{
    let EMAIL_REGEX = "^([^@\\s]+)@((?:[-a-z0-9]+\\.)+[a-z]{2,})$"
    let predicate = NSPredicate(format: "SELF MATCHES %@", EMAIL_REGEX)
    return predicate.evaluate(with: text)
}

func className(_ name:AnyClass) -> String {
    return name.self.description().components(separatedBy: ".").last!
}













//====================================================================================================

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}

struct Version{
    static let SYS_VERSION_FLOAT = (UIDevice.current.systemVersion as NSString).floatValue
    static let iOS7 = (Version.SYS_VERSION_FLOAT < 8.0 && Version.SYS_VERSION_FLOAT >= 7.0)
    static let iOS8 = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
    static let iOS9 = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
}

