//
//  MainVC.swift
//  AppStructure
//
//  Created by Fahid Attique on 10/26/17.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    
    // MARK: - Static
    
    
    // MARK: - Class Properties
    
    
    // MARK: - IBOutlets
    
    
    // MARK: - Life Cycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
//        showOKAlert(title: "Hello", message:"Hello ! I am an alert controller.")
//
//        showOKAlert(title: "Hello", message:"Hello ! I am an alert controller.", actionHandler: { (action) in
//
//            self.showAlert(title: "Multiple Buttons Alert", message: "I am an alert controller with multiple buttons.", firstTitle: "First", firstHandler: { (action) in
//
//                QL1("firstHandler Tapped")
//
//            }, secondTitle: "Second") { (action) in
//
//                QL1("secondHandler Tapped")
//            }
//
//        })
//
//        showAlert(title: "Multiple Buttons Alert", message: "I am an alert controller with multiple buttons.", firstTitle: "First", firstHandler: { (action) in
//
//            QL1("firstHandler Tapped")
//
//        }, secondTitle: "Second") { (action) in
//
//            QL1("secondHandler Tapped")
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
    // MARK: - Functions
    
    
    
    // MARK: - IBActions
    
}
