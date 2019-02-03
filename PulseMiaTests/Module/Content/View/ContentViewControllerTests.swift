//
//  ContentViewControllerTests.swift
//  PulseMiaTests
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import XCTest
@testable import PulseMia

class ContentViewControllerTests: XCTestCase {
    
    func test_viewDidLoad_rendersHeaderTitle() {
        XCTAssertEqual(makeSUT().navigationItem.title, "Contents")
    }
    
    func test_viewDidLoad_configuresView() {
        XCTAssertNotNil(makeSUT())
    }
    
    func test_viewController_rendersWithoutContents() {
        XCTAssertEqual(makeSUT().numberOfItems(), 0)
    }
    
    func test_viewController_rendersContents() {
        let content = Content(title: "Content1")
        let content2 = Content(title: "Content2")
        let content3 = Content(title: "Content3")
        
        XCTAssertEqual(makeSUT([content]).numberOfItems(), 1)
        XCTAssertEqual(makeSUT([content, content2]).numberOfItems(), 2)
        XCTAssertEqual(makeSUT([content, content2, content3]).numberOfItems(), 3)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(_ contents: [Content] = []) -> ContentViewController {
        let apiEngine = APIEngine()
        let apiClient = MockAPIClient(contents: contents, apiEngine: apiEngine)
        let viewModel = ContentViewModel(apiClient: apiClient)
       viewModel.contents = contents
        let sut = ContentViewController(viewModel: viewModel)
        _ = sut.view
        sut.reloadData()
        return sut
    }
    
}

private extension ContentViewController {
    
    func numberOfItems() -> Int {
        return viewModel.numberOfItems()
    }
    
}
