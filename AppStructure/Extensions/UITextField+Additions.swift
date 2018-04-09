//
//  UITextField+Additions.swift
//  AppStructure
//
//  Created by Fahid Attique on 10/01/2018.
//  Copyright © 2018 Fahad Attique. All rights reserved.
//

import Foundation

extension UITextField{
 
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedStringKey.foregroundColor: newValue!])
        }
    }
}
