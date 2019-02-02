//
//  ContentResponse.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

struct ContentResponse: Codable {
    var items: [Content]
}

struct Content: Codable {
    var id: Int
    var title: String
    var subtitle: String
    var date: String
    
    func posterUrl() -> String {
        return AppConstants.API.PosterURL
    }
}
