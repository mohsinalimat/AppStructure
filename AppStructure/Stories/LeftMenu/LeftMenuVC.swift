//
//  LeftMenuVC.swift
//  AppStructure
//
//  Created by Fahid Attique on 11/1/17.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import UIKit

class LeftMenuVC: UIViewController {

    // MARK: - Static
    
    
    // MARK: - Class Properties
    
    
    // MARK: - IBOutlets
    
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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

    @IBAction func logout(_ sender: Any) {
        
        guard let panel = self.panel else { return }
        
        User.logoutUser()
        
        let centerVC = UIStoryboard.main.instantiateInitialViewController()!
        _ = panel.center(centerVC, afterThat: {
            _ = panel.left(nil)
        })
    }
}
