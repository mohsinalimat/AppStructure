//
//  FAABCardCvvField.swift
//  AppStructure
//
//  Created by Fahid Attique on 17/02/2018.
//  Copyright © 2018 Fahad Attique. All rights reserved.
//

import UIKit

class FAABCardCvvField: ABCardCvvField {

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, FATextField.padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, FATextField.padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, FATextField.padding)
    }
}
