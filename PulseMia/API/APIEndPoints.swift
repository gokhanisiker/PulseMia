//
//  APIEndPoints.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

enum APIEndPoints: String {
    case contents = "contentList.json"
    
    func buildUrl() -> String {
        return "\(AppConstants.API.BaseURL)\(self.rawValue)"
    }
}
