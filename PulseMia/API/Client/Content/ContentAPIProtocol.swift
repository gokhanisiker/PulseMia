//
//  ContentAPIProtocol.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

protocol ContentAPIProtocol {
    
    typealias ContentsCompletionHandler = ([String]) -> Void
    
    func getContents(completion: (ContentsCompletionHandler))
    
}
