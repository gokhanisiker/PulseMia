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

struct ContentDetailsResponse: Codable {
    var item: ContentDetails
}
