//
//  ContentDetailsViewModel.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 02/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

class ContentDetailsViewModel {
    
    private var apiClient: ContentAPIProtocol!
    private var content: Content!
    private var contentDetails: ContentDetails!
    
    init(apiClient: ContentAPIProtocol, content: Content) {
        self.apiClient = apiClient
        self.content = content
    }
    
    func getTitle() -> String {
        return "Content Details"
    }
    
    func getContentDetatils() -> ContentDetails {
        return contentDetails
    }
    
    func getData(completion: @escaping () -> Void) {
        apiClient.getDetails(of: content) { [weak self] (contentDetails, error) in
            if error == nil {
                self?.contentDetails = contentDetails
            }
            completion()
        }
    }
    
}
