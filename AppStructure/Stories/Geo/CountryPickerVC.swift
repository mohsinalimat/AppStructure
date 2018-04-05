//
//  CountryPickerVC.swift
//  AppStructure
//
//  Created by Fahid Attique on 24/01/2018.
//  Copyright © 2018 FahidAttique. All rights reserved.
//

import UIKit

class CountryPickerVC: UIViewController {

    
    
    // MARK: - Static

    static func fetchAndLoadCountries(from controller: UIViewController) {
        
        let hud = ProgressHud.showHUDAddedTo(controller.view)
        UserLoader().getCountriesList(successBlock: { (countries) in
            
            hud.hide()
            
            
        }) { (error) in
            
            hud.hide()
            Utility.showAlert(error!, onController: controller)
        }

        
    }
    
    
    // MARK: - Class Properties
    
    fileprivate let userLoader = UserLoader()
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var countryTableView: UITableView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        configureView()
        
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
    
    fileprivate func configureView() {
        
        countryTableView.registerNib(from: CountryCell.self)
        countryTableView.rowHeight = UITableViewAutomaticDimension

    }
    
    
    // MARK: - IBActions
    
    
}







extension CountryPickerVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: CountryCell = tableView.dequeue(CountryCell.self) else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}






extension CountryPickerVC : UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}





