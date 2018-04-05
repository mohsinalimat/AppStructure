//
//  SampleCell.swift
//  AppStructure
//
//  Created by Ghulam Rasool  on 18/12/2017.
//  Copyright © 2017 FahidAttique. All rights reserved.
//

import UIKit

class SampleCell: UITableViewCell {

    
    // MARK: - IBOutlets
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    

    
    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    

    // MARK: - Functions

    func configureCell(user : User){
        lblName.text = user.name
        lblDescription.text = user.description
    }
}
