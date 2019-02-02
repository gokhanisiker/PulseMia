//
//  APIError.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

enum APIError: String, Error {
    case invalidURL = "The URL is invalid"
    case invalidData = "The data is invalid"
    case invalidResponse = "The response is invalid"
}
