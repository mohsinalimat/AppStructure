//
//  FirstVC.swift
//  AppStructure
//
//  Created by Ghulam Rasool  on 18/12/2017.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {

    
    // MARK: - IBOutlets
    
    @IBOutlet weak var usersTableView: UITableView!

    
    

    // MARK: - Class Properties

    fileprivate var dataArray = [User]()


    
   
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureView()
        loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    

    
    
    
    // MARK: - Functions

    fileprivate func configureView() {
        usersTableView.registerNib(from: SampleCell.self)
        usersTableView.rowHeight = UITableViewAutomaticDimension
    }

    
    fileprivate func loadData(){
        
        let user1: User = User(data: ["name" : "Fahid Attique","description" : "IOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS DeveloperIOS Developer"])
        let user2: User = User(data: ["name" : "Ghulam Mujtaba","description" : "IOS Developer"])
        let user3: User = User(data: ["name" : "Ejaz Ahmed","description" : "Android Developer"])
        let user4: User = User(data: ["name" : "Ahsan Hameed","description" : "Android Developer"])
        dataArray = [user1,user2,user3,user4,user1,user2,user3,user4]
    }
    


}








extension FirstVC : UITableViewDataSource {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: SampleCell = tableView.dequeue(SampleCell.self) else { return UITableViewCell() }
        cell.configureCell(user: dataArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}






extension FirstVC : UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}


