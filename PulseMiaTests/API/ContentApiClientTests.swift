//
//  ContentApiClientTests.swift
//  PulseMiaTests
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import XCTest
@testable import PulseMia

class ContentApiClientTests: XCTestCase {
    
    func test_completionHandler_called() {
        var completionHandlerCalled = false
        let sut = ContentAPIClient()
        
        sut.getContents() {_ in
            completionHandlerCalled = true
        }
        
        XCTAssertTrue(completionHandlerCalled)
    }
    
}
