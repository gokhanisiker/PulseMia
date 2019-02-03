//
//  ContentExtension.swift
//  PulseMiaTests
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation
@testable import PulseMia

extension Content {
    
    init(title: String) {
        self.init(id: 0, title: title, subtitle: "Mock Subtitle", date: "12/02/2019")
    }
    
}

extension Content: Equatable {
    
    public static func == (lhs: Content, rhs: Content) -> Bool {
        return lhs.title == rhs.title
    }

}

