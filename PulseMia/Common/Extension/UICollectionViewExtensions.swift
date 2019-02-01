//
//  UICollectionViewExtensions.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register(_ cell: UICollectionViewCell.Type) {
        register(UINib(nibName: cell.identifier, bundle: nil), forCellWithReuseIdentifier: cell.identifier)
    }
    
}
