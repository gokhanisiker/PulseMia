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
    
    //MARK: - Helpers
    
    private func makeSUT() -> ContentDetailsViewModel {
        let apiClient = MockAPIClient(contents: [], apiEngine: APIEngine())
        let sut = ContentDetailsViewModel(apiClient: apiClient, content: Content(title: "Content1"))
        return sut
    }
    
}
