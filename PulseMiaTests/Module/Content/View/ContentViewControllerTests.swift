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
    
    func test_collectionView_rendersWithoutMovies() {
        XCTAssertEqual(makeSUT().numberOfItems(), 0)
    }
    
    func test_collectionView_rendersMovies() {
        XCTAssertEqual(makeSUT(["Content1"]).numberOfItems(), 1)
        XCTAssertEqual(makeSUT(["Content1", "Content2"]).numberOfItems(), 2)
        XCTAssertEqual(makeSUT(["Content1", "Content2", "Content3"]).numberOfItems(), 3)
    }
    
    //MARK: - Helpers
    
    private func makeSUT(_ contents: [String] = []) -> ContentViewController {
        let sut = ContentViewController(contents: contents)
        _ = sut.view
        return sut
    }
    
}

fileprivate extension ContentViewController {
    
    func numberOfItems() -> Int {
        return collectionView.numberOfItems(inSection: 0)
    }
    
    func getCollectionView() -> UICollectionView {
        return collectionView
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
    
}
