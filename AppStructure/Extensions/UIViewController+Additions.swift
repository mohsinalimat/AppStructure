//
//  UIViewController+Additions.swift
//  LanguageParrot
//
//  Created by Fahid Attique on 01/08/2016.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit



extension UIViewController {

    
    
    // MARK: - Static
    
    static func instantiate(from storyboard: UIStoryboard) -> UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier)
    }
    


    
    
    // MARK: - Class Functions

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
    
    
    
    func endEditing() {
        view.endEditing(true)
    }
    
    
    
    fileprivate func dismissPresentedController() {
        self.dismiss(animated: true, completion: { () -> Void in
            QL2("\(String(describing: type(of: self))) is dismiss.")
        })
    }
    
    fileprivate func dismissPushedController() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func presentViewController(_ viewControllerToPresent: UIViewController) {
        self.presentViewController(viewControllerToPresent, animated: true)
    }
    
    func presentViewController(_ viewControllerToPresent: UIViewController, animated flag: Bool) {
        self.present(viewControllerToPresent, animated: flag) { () -> Void in
            QL2("\(String(describing: type(of: viewControllerToPresent))) is presented.")
        }
    }
    
    func dismissViewController(_ completion: (() -> Void)? = nil) {
        dismiss(animated: true, completion: completion)
    }
    
    @objc func dismissMe() {
        if let navigationViewController = self.navigationController {
            
            if (navigationViewController.viewControllers.count > 1) {
                dismissPushedController()
            } else {
                dismissPresentedController()
            }
            
        } else {
            dismissPresentedController()
        }
    }
    
    
    @IBAction func dismiss(_ sender: UIButton) {
        endEditing()
        dismissMe()
    }
    
    func addCancelButton() {
        
        let cancelButton = UIBarButtonItem(image: #imageLiteral(resourceName: "back"), style: .plain, target: self, action: #selector(dismissMe))
        navigationItem.leftBarButtonItem = cancelButton
        
    }

    
}





















// MARK: - Alert Controllers

extension UIViewController {

    
    func showOKAlert(title: String, message: String, actionHandler handler:((UIAlertAction) -> Void)? = nil) {
        
        showAlert(title: title, message: message, actionTitle: buttonOK, actionHandler: handler)
    }


    
    
    func showAlert(title: String, message: String, actionTitle: String, actionHandler handler:((UIAlertAction) -> Void)?) {
        
        let action = UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default, handler: handler)
        let alert = UIAlertController.alertWith(title: title, message: message, actions: [action], style: UIAlertControllerStyle.alert)
        present(alert, animated: true, completion: nil)
    }

    
    
    
    
    func showAlert(title: String, message: String, firstTitle: String, firstHandler:((UIAlertAction) -> Void)?, secondTitle: String, secondhandler:((UIAlertAction) -> Void)?) {
        
        let action1 = UIAlertAction(title: firstTitle,  style: UIAlertActionStyle.default,  handler: firstHandler)
        let action2 = UIAlertAction(title: secondTitle, style: UIAlertActionStyle.default, handler: secondhandler)

        let alert = UIAlertController.alertWith(title: title, message: message, actions: [action1, action2], style: UIAlertControllerStyle.alert)
        present(alert, animated: true, completion: nil)
    }
    
}















// MARK: - LoadAble Protocol

protocol LoadAble {

    func showHud()
    func hideHud()
}











// MARK: - Huds

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


