//
//  ProgressHud.swift
//  LanguageParrot
//
//  Created by Fahid Attique on 04/08/2016.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit
import MBProgressHUD


class ProgressHud: MBProgressHUD {
    
    fileprivate static let defaultDelay: TimeInterval = 3
    
    class func showHUDAddedTo(_ view: UIView) -> ProgressHud {
        return showAdded(to: view, animated: true)
    }
    
    class func showErrorAlertHUDView(_ view: UIView = UIViewController.topViewController()!.view, error: NSError) {
        _ = showAlertHUDAddedTo(view, title: "Error", message: error.localizedDescription)
    }
    
    class func showAlertHUDAddedTo(_ view: UIView = UIViewController.topViewController()!.view, title: String?, message: String? = nil, forDelay delay: TimeInterval = defaultDelay) -> ProgressHud {
        let hud = ProgressHud.showHUDAddedTo(view)
        
        hud.mode = .text
        hud.label.numberOfLines = 0
        hud.label.font = UIFont.systemFont(ofSize: 17)
        hud.label.text = title
        
        hud.detailsLabel.text = message
        hud.detailsLabel.font = UIFont.systemFont(ofSize: 15)
        
        hud.removeFromSuperViewOnHide = true
        hud.hide(animated: true, afterDelay: delay)
        return hud
    }
    
    class func hideHUDForView(_ view: UIView) -> Bool {
        return self.hide(for: view, animated: true)
    }
    
    func hide() {
        self.hide(animated: true)
    }
    
    class func showDimBackgroundHUDAddedTo(_ view: UIView, customView: UIView) -> ProgressHud {
        let hud = ProgressHud.showHUDAddedTo(view)
        
        // Set the custom view mode to show any view.
        hud.mode = .customView
        hud.label.text = ""
        hud.detailsLabel.text = ""
        hud.customView = customView
        
        hud.bezelView.color = UIColor.clear
        hud.bezelView.style = .solidColor
        
        hud.backgroundView.color = UIColor(white: 0.13, alpha: 0.9)
        hud.bezelView.style = .solidColor
        
        
        
        
        return hud
    }
    
    class func showHUDAddedTo(_ view: UIView, customView:UIView, forDelay delay: TimeInterval) -> ProgressHud {
        let hud = ProgressHud.showHUDAddedTo(view)
        
        // Set the custom view mode to show any view.
        hud.mode = .customView
        hud.label.text = ""
        hud.detailsLabel.text = ""
        hud.customView = customView
        hud.bezelView.layer.cornerRadius = 4.0
        hud.margin = 10.0
        hud.bezelView.color = UIColor(white: 0.25, alpha: 0.8)
        hud.bezelView.style = .solidColor
        hud.hide(animated: true, afterDelay: delay)
        return hud
        
    }


    
    class func hud(for view: UIView) -> ProgressHud? {
        
        for view in view.subviews {
            
            if view.isKind(of: self) {
                
                if let hudView = view as? ProgressHud {
                    return hudView
                }
            }
        }
        
        return nil
    }
}











