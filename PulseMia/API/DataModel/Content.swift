//
//  Content.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 02/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

protocol ContentProtocol: Codable {
    var id: Int { get set }
    var title: String { get set }
    var subtitle: String { get set }
    var date: String { get set }
}

extension ContentProtocol {
    
    func getPosterUrl() -> String {
        return AppConstants.API.PosterURL
    }
    
    func getPosterDetailUrl() -> String {
        return AppConstants.API.PosterDetailURL
    }
    
}

struct Content: ContentProtocol {
    var id: Int
    var title: String
    var subtitle: String
    var date: String
}
