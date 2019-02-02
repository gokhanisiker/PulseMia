//
//  AppConstants.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

struct AppConstants {
    
    struct API {
        static let BaseURL = "http://dynamic.pulselive.com/test/native/"
        static let PosterURL = "https://loremflickr.com/400/600/soccer"
        static let PosterDetailURL = "https://loremflickr.com/600/400/soccer"
    }
    
    struct ContentCollection {
        static let PosterImageRatio: Float = 3.0/2.0
        static let HorizontalSpaceBetweenItems: Float = 8
        static let VerticleSpaceBetweenItems: Float = 8
    }
    
}
