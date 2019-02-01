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
        let sut = makeSUT(["Content1", "Content2", "Content3"])
        XCTAssertEqual(sut.contents.count, sut.numberOfItems())
    }
    
    //MARK: - Helpers
    
    private func makeSUT(_ contents: [String] = []) -> ContentViewModel {
        let sut = ContentViewModel(contents: contents)
        return sut
    }
    
}
