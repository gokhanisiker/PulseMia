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
        let e = expectation(description: "apiCall")
        
        var completionHandlerCalled = false
        let sut = ContentAPIClient(apiEngine: APIEngine())
        
        sut.getContents() { (_,_) in
            completionHandlerCalled = true
            e.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        XCTAssertTrue(completionHandlerCalled)
    }
    
    func test_getDetailscompletionHandler_called() {
        let e = expectation(description: "apiCall")
        
        var completionHandlerCalled = false
        let sut = ContentAPIClient(apiEngine: APIEngine())
        
        sut.getDetails(of: Content(title: "Content1")) { (_,_) in
            completionHandlerCalled = true
            e.fulfill()
        }
        
        waitForExpectations(timeout: 5.0, handler: nil)
        XCTAssertTrue(completionHandlerCalled)
    }
    
}
