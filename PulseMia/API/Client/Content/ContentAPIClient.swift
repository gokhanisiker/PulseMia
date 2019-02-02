//
//  ContentAPIClient.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

class ContentAPIClient: ContentAPIProtocol {
    
    var apiEngine: APIEngineProtocol
    
    init(apiEngine: APIEngineProtocol) {
        self.apiEngine = apiEngine
    }
    
    func getContents(completion: @escaping ContentsCompletionHandler) {
        guard let url = URL(string: APIEndPoints.contents.buildUrl()) else {
            completion([], APIError.invalidURL)
            return
        }
        
        apiEngine.get(url: url) { (data, error) in
            if let error = error {
                completion([], error)
                return
            }
            
            guard let data = data else {
                completion([], APIError.invalidData)
                return
            }
            
            if let response = try? JSONDecoder().decode(ContentResponse.self, from: data) {
                completion(response.items, nil)
                return
            } else {
                completion([], APIError.invalidResponse)
            }
        }
    }
    
    func getDetails(of content: Content, completion: @escaping ContentDetailsCompletionHandler) {
        guard let url = URL(string: APIEndPoints.contentDetails(content: content).buildUrl()) else {
            completion(nil, APIError.invalidURL)
            return
        }
        
        apiEngine.get(url: url) { (data, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, APIError.invalidData)
                return
            }
            
            if let response = try? JSONDecoder().decode(ContentDetails.self, from: data) {
                completion(response, nil)
                return
            } else {
                completion(nil, APIError.invalidResponse)
            }
            
        }
        
    }
    
}
