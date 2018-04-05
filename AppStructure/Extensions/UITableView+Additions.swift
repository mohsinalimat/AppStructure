//
//  UITableView+Additions.swift
//  AppStructure
//
//  Created by Fahid Attique on 18/01/2018.
//  Copyright © 2018 FahidAttique. All rights reserved.
//

import Foundation

extension UITableView {
    
    func registerNib(from cellClass: UITableViewCell.Type) {
        let identifier = cellClass.identifier
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func registerCell(from cellClass: UITableViewCell.Type) {
        let identifier = cellClass.identifier
        register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func dequeue<T: Any>(_ cell: UITableViewCell.Type) -> T? {
        return dequeueReusableCell(withIdentifier: cell.identifier) as? T
    }
    
}
