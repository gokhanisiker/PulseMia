//
//  APIEngine.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

class APIEngine: APIEngineProtocol {
    
    var urlSession: URLSessionProtocol
    
    init(urlSession: URLSessionProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func get(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        let request = URLRequest(url: url)
        
        let dataTask = urlSession.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }
        dataTask.resume()
    }
}
