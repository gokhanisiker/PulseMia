//
//  ContentDetailsHeaderCellTests.swift
//  PulseMiaTests
//
//  Created by Gokhan Isiker on 03/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import XCTest
@testable import PulseMia

class ContentDetailsHeaderCellTests: XCTestCase {
    
    func test_setup_rendersCorrectData() {
        let sut = makeSUT()
        let title = "Title"
        
        sut.setup(with: ContentDetails(title: title))
        
        XCTAssertNotNil(sut.detailHeaderLabel)
        XCTAssertEqual(sut.detailHeaderLabel.text, title)
    }
    
    //    Mark: Helpers
    
    private func makeSUT() -> ContentDetailsHeaderCell {
        let nib = UINib(nibName: ContentDetailsHeaderCell.identifier, bundle: nil)
        let cell = nib.instantiate(withOwner: nil, options: [:]).first as! ContentDetailsHeaderCell
        return cell
    }
    
}
