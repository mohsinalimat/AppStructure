//
//  LeftMenuNavigationVC.swift
//  AppStructure
//
//  Created by Fahid Attique on 11/1/17.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import UIKit

class LeftMenuNavigationVC: UINavigationController {

 
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        addLeftMenuIfNeeded()
    }
    
    
    override init(rootViewController: UIViewController) {

        super.init(rootViewController: rootViewController)
        addLeftMenuIfNeeded()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

    
    // MARK: - Functions
    
    fileprivate func configureView() {
    }


    fileprivate func addLeftMenuIfNeeded() {
        
        if viewControllers.count >= 1 {
            let leftMenu = UIBarButtonItem.init(image: #imageLiteral(resourceName: "menu"), style: UIBarButtonItemStyle.plain, target: nil, action: #selector(openLeft))
            viewControllers[0].navigationItem.leftBarButtonItem = leftMenu
        }
    }

    
    @objc fileprivate func openLeft() {
        if let panel = self.panel { panel.openLeft(animated: true) }
    }
    
}
