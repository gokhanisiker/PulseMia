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
    
    var contents = [Content]()
    var contentDetails: ContentDetails!
    var apiEngine: APIEngineProtocol
    
    init(contents: [Content], apiEngine: APIEngineProtocol) {
        self.contents = contents
        self.apiEngine = apiEngine
    }
    
    func getContents(completion: @escaping ContentsCompletionHandler) {
        completion(contents, nil)
    }
    
    func getDetails(of content: Content, completion: @escaping (ContentAPIProtocol.ContentDetailsCompletionHandler)) {
        completion(contentDetails, nil)
    }
    
}
