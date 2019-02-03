//
//  UITableViewCellExtension.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 02/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
}
