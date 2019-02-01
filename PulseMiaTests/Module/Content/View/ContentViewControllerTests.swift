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
        XCTAssertEqual(makeSUT(["Content1"]).numberOfItems(), 1)
        XCTAssertEqual(makeSUT(["Content1", "Content2"]).numberOfItems(), 2)
        XCTAssertEqual(makeSUT(["Content1", "Content2", "Content3"]).numberOfItems(), 3)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(_ contents: [String] = []) -> ContentViewController {
        let apiClient = MockAPIClient(contents: contents)
        let viewModel = ContentViewModel(apiClient: apiClient)
        viewModel.getData()
        let sut = ContentViewController(viewModel: viewModel)
        _ = sut.view
        return sut
    }
    
}

private extension ContentViewController {
    
    func numberOfItems() -> Int {
        return viewModel.numberOfItems()
    }
    
}
