//
//  ContentAPIProtocol.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

protocol ContentAPIProtocol {
    
    typealias ContentsCompletionHandler = ([Content], Error?) -> Void
    typealias ContentDetailsCompletionHandler = (ContentDetails?, Error?) -> Void
    
    var apiEngine: APIEngineProtocol { get set }
    
    func getContents(completion: @escaping (ContentsCompletionHandler))
    func getDetails(of content: Content, completion: @escaping (ContentDetailsCompletionHandler))
}
