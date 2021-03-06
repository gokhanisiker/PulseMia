//
//  AppCoordinatorTests.swift
//  PulseMiaTests
//
//  Created by Gokhan Isiker on 02/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import XCTest
@testable import PulseMia

class AppCoordinatorTests: XCTestCase {
    
    func test_coordinator_windowNil() {
        let sut = AppCoordinator(window: UIWindow())
                
        XCTAssertNil(sut.rootViewController)
    }
    
    func test_appCoordinator_createsRootViewController() {
        let sut = AppCoordinator(window: UIWindow(frame: UIScreen.main.bounds))
        
        sut.start()
        
        XCTAssertNotNil(sut.rootViewController)
    }
    
}
