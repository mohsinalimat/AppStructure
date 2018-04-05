//
//  UIStoryboard+Additions.swift
//  LanguageParrot
//
//  Created by Fahid Attique on 01/08/2016.
//  Copyright © 2017 Fahid Attique. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    
    // MARK: Class Properties

    class var main: UIStoryboard {
        return storyboard(loadWithName: "Main")
    }
    
    class var home: UIStoryboard {
        return storyboard(loadWithName: "Home")
    }

    class var leftMenu: UIStoryboard {
        return storyboard(loadWithName: "LeftMenu")
    }


    
    // MARK: Functions

    fileprivate class func storyboard(loadWithName name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: Bundle.main)
    }
    
    func loadViewController(_ identifier: String) -> UIViewController {
        return instantiateViewController(withIdentifier: identifier)
    }
}
