//
//  ContentDetailsViewControllerTests.swift
//  PulseMiaTests
//
//  Created by Gokhan Isiker on 02/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import XCTest
@testable import PulseMia

class ContentDetailsViewControllerTests: XCTestCase {
    
    func test_viewDidLoad_rendersHeaderTitle() {
        XCTAssertEqual(makeSUT().navigationItem.title, "Content Details")
    }
    
    func test_viewDidLoad_initiatesViewModel() {
        XCTAssertNotNil(makeSUT().viewModel)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(contentDetails: ContentDetails = ContentDetails(body: "")) -> ContentDetailsViewController {
        let apiClient = MockAPIClient(contents: [], apiEngine: APIEngine())
        let viewModel = ContentDetailsViewModel(apiClient: apiClient, content: Content(title: "Content1"))
        
        let sut = ContentDetailsViewController(viewModel: viewModel)
        _ = sut.view
        return sut
    }
    
}

extension ContentDetails {
    
    init(body: String) {
        self.init(id: 35, title: "", subtitle: "", date: "", body: body)
    }
    
    init(title: String) {
        self.init(id: 0, title: title, subtitle: "Mock Subtitle", date: "12/02/2019", body: "body")
    }
    
}

