//
//  ContentExtension.swift
//  PulseMiaTests
//
//  Created by Gökhan Işıker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation
@testable import PulseMia

extension Content {
    
    init(title: String) {
        self.init(id: 0, title: title, subTitle: "Mock Subtitle", date: Date())
    }
    
}
