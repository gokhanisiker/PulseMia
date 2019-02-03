//
//  ContentDetailsViewModelTests.swift
//  PulseMiaTests
//
//  Created by Gokhan Isiker on 02/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import XCTest
@testable import PulseMia

class ContentDetailsViewModelTests: XCTestCase {
        
    func test_viewModel_rendersTitle() {
        XCTAssertEqual(makeSUT().getTitle(), "Content Details")
    }
    
    func test_viewModel_rendersRows() {
        let title = "ContentDetail1"
        let sut = makeSUT(title: title)
        
        XCTAssertEqual(sut.getContent().title, title)
    }
    
    func test_viewModel_getsContentDetailsDataFromAPI() {
        let sut = makeSUT()
        
        var detailsCalled = false
        
        sut.getData  {
            detailsCalled = true
        }
        
        XCTAssertTrue(detailsCalled)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(title: String = "ContentDetailDefault") -> ContentDetailsViewModel {
        let apiClient = MockAPIClient(contents: [], apiEngine: APIEngine())
        let sut = ContentDetailsViewModel(apiClient: apiClient, content: Content(title: title))
        return sut
    }
    
}
