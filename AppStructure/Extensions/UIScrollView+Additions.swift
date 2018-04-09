//
//  UIScrollView+Additions.swift
//  AppStructure
//
//  Created by Fahid Attique on 15/02/2018.
//  Copyright © 2018 Fahad Attique. All rights reserved.
//

import Foundation

extension UIScrollView {
 
    func scrollToTop() {
        setContentOffset(CGPoint.zero, animated: true)
    }
    
    func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: true)
    }
}
