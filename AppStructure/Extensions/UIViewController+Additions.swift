//
//  UIViewController+Additions.swift
//  LanguageParrot
//
//  Created by Fahid Attique on 01/08/2016.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit

protocol LoadAble {
    func showHud()
    func hideHud()
}


extension UIViewController {

    static func instantiate(from storyboard: UIStoryboard) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
    

    class func topViewController(_ base: UIViewController? = UIApplication.shared.windows.first!.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(presented)
        }
        return base
    }
    
    
    func showAlertOnTopVC(_ title: String, _ message: String) {
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            topController.showAlertController(buttonOK, title, message)
        }
    }
    
    
    func showAlertWithCompletionBlock(_ title: String, _ message: String, completion: ((UIAlertAction) -> Void)?) {
        self.showAlertControllerWithCompletionBlock(self, title, message, completion: completion)
    }
    
    
    func showAlertOnTopVCWithCompletionBlock(_ title: String, _ message: String, completion: ((UIAlertAction) -> Void)?) {
        
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            topController.showAlertControllerWithCompletionBlock(topController, title, message, completion: completion)
        }
        
    }
    
    
    func showAlert(_ title: String, _ message: String) {
        
        self.showAlertController(buttonOK, title, message)
        
    }
    
    
    func showCancelAlert(_ title: String, _ message: String) {
        
        self.showAlertController(buttonCancel, title, message)
        
    }
    
    
    fileprivate func showAlertController(_ buttonTitle: String, _ title: String, _ message: String) {
        
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: buttonTitle, style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    fileprivate func showAlertControllerWithCompletionBlock(_ vc: UIViewController, _ title: String, _ message: String, completion: ((UIAlertAction) -> Void)?) {
        
        let alertController = UIAlertController(title: title, message:
            message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: buttonOK, style: UIAlertActionStyle.default,handler: completion))
        
        vc.present(alertController, animated: true, completion: nil)
        
    }
    
    
}






extension UIViewController: LoadAble {
    
    func showHud(){
 
        if ProgressHud.hud(for: view) == nil {
            _ = ProgressHud.showHUDAddedTo(view)
        }
    }

    func hideHud() {
        _ = ProgressHud.hideHUDForView(view)
    }
}
