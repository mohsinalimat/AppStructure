//
//  LoginVC.swift
//  AppStructure
//
//  Created by Fahid Attique on 11/1/17.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {


    
    // MARK: - Static
    
    
    
    
    
    
    // MARK: - Class Properties
    
    
    
    
    
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var emailTextField: FATextField!
    @IBOutlet weak var passwordTextField: FATextField!
    
    
    
    
    
    
    
    
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
    
    
    fileprivate func validateFields() -> (Bool, String?) {
        
        let email = self.emailTextField.text!
        let pass = self.passwordTextField.text!
        
        //        if !phoneFieldView.isValid() { return (false, messagePhoneValidationFailed)}
        if !email.isEmail() { return (false, "Please enter valid email")}
        if pass.isEmpty { return (false, "Please enter password")}
        return (true, nil)
    }
    
    @IBAction func nextTouchUpInside(_ sender: AnyObject) {
        
        let (isValid, errorMessage) = validateFields()
        
        if (!isValid) {
            Utility.showCancelTypeAlert("Invalid Fields", message: errorMessage, buttonTitle: buttonOK, onController: self)
            return
        }
        
    }
    
    
    // MARK: - IBActions
    
    @IBAction func login(_ sender: Any) {
        
        
        let (isValid, errorMessage) = validateFields()
        
        if (!isValid) {
            Utility.showCancelTypeAlert("Invalid Fields", message: errorMessage, buttonTitle: buttonOK, onController: self)
            return
        }
        
        
        self.showHud()
        let params = [
            "email" : self.emailTextField.text!,
            "password": self.passwordTextField.text!
        ]
        let userLoader = UserLoader()
        userLoader.loginUserWith(parameters: params as [String : AnyObject], successBlock: { (user) in
            
            self.hideHud()
            print(user)
            
            if user.saveUser() {
                print("User saved")
            }
            guard let panel = self.panel else { return }
            
            let centerVC = UIStoryboard.home.instantiateInitialViewController()!
            let leftVC  = LeftMenuVC.instantiate(from: UIStoryboard.leftMenu)
            _ = panel.center(centerVC).left(leftVC)
            
        }) { (error) in
            self.hideHud()
            self.showAlert(title: String(describing: error?.code), message: (error?.localizedDescription)!, actionTitle: "OK", actionHandler: nil)
        }

    }
}
