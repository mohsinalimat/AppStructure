//
//  UICollectionView+Additions.swift
//  AppStructure
//
//  Created by Fahid Attique on 17/01/2018.
//  Copyright © 2018 Fahad Attique. All rights reserved.
//

import Foundation

extension UICollectionView {
    
    func registerNibFrom(cellClass: UICollectionViewCell.Type) {
        let cellInfo = cellClass.identifier
        register(UINib(nibName: cellInfo, bundle: nil), forCellWithReuseIdentifier: cellInfo)
    }
    
    func registerNibFrom(headerClass: UICollectionReusableView.Type) {

        let cellInfo = headerClass.identifier
        register(UINib(nibName: cellInfo, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: cellInfo)
    }

    func registerNibFrom(footerClass: UICollectionReusableView.Type) {
        
        let cellInfo = footerClass.identifier
        register(UINib(nibName: cellInfo, bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: cellInfo)
    }
}








extension UICollectionView {
    
    func addRefreshControl(_ refresher: UIRefreshControl, withSelector selector:Selector) {
        
        refresher.addTarget(nil, action: selector, for: .valueChanged)
        if #available(iOS 10.0, *) {
            refreshControl = refresher
        } else {
            addSubview(refresher)
        }
    }
    
}
