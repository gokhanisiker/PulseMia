//
//  ContentResponse.swift
//  PulseMia
//
//  Created by Gökhan Işıker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

struct ContentResponse: Decodable {
    var items: [Content]
}

struct Content: Decodable {
    var id: Int
    var title: String
    var subTitle: String
    var date: Date
}
