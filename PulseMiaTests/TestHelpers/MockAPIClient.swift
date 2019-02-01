//
//  MockAPIClient.swift
//  PulseMiaTests
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import XCTest
@testable import PulseMia

class MockAPIClient: ContentAPIProtocol {
    
    var contents = [String]()
    
    init(contents: [String]) {
        self.contents = contents
    }
    
    func getContents(completion: ContentsCompletionHandler) {
        completion(contents)
    }
    
}
