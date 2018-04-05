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
}






extension UIViewController: LoadAble {
    
    func showHud(){
 
        if ProgressHud.hud(for: view) == nil {
            ProgressHud.showHUDAddedTo(view)
        }
    }

    func hideHud() {
        ProgressHud.hideHUDForView(view)
    }
}


