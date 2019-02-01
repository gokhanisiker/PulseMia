//
//  NowPlayingViewModelTests.swift
//  PulseMiaTests
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import XCTest
@testable import PulseMia

class ContentViewModelTests: XCTestCase {
    
    func test_viewModel_rendersTitle() {
        let sut = makeSUT()
        XCTAssertEqual(sut.getTitle(), "Contents")
    }
    
    func test_viewModel_rendersNumberOfItems() {
        XCTAssertEqual(makeSUT().numberOfItems(), 0)
    }
    
    func test_viewModel_rendersTexts() {
        let content = Content(title: "Content1")
        let content2 = Content(title: "Content2")
        let content3 = Content(title: "Content3")
        
        let sut = makeSUT([content, content2, content3])
        XCTAssertEqual(sut.contents.count, sut.numberOfItems())
    }
    
    //MARK: - Helpers
    
    private func makeSUT(_ contents: [Content] = []) -> ContentViewModel {
        let apiClient = ContentAPIClient(apiEngine: APIEngine())
        let sut = ContentViewModel(apiClient: apiClient)
        return sut
    }
    
}
