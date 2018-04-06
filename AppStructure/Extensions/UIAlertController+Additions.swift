//
//  UIAlertController+Additions.swift
//  AppStructure
//
//  Created by Fahid Attique on 06/04/2018.
//  Copyright © 2018 FahidAttique. All rights reserved.
//

import Foundation



extension UIAlertController {
    
    // MARK: - Static
    
    static func alertWith(title: String, message: String, actions: [UIAlertAction], style: UIAlertControllerStyle) -> UIAlertController {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        
        for action in actions {
            alertController.addAction(action)
        }
        
        return alertController
    }
}
