//
//  ContentViewModel.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

class ContentViewModel {
    
    var contents: [String] = []

    init(contents: [String]) {
        self.contents = contents
    }
    
    func getTitle() -> String {
        return "Contents"
    }
    
    func numberOfItems() -> Int {
        return contents.count
    }
    
}
