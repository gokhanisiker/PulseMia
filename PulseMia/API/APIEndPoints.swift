//
//  APIEndPoints.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

enum APIEndPoints {
    case contents
    case contentDetails(content: Content)
    
    func endPoint() -> String {
        switch self {
        case .contents:
            return "contentList.json"
        case .contentDetails(let content):
            return "content/\(content.id).json"
        }
    }
    
    func buildUrl() -> String {
        return "\(AppConstants.API.BaseURL)\(endPoint())"
    }
}
