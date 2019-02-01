//
//  ContentViewModel.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

class ContentViewModel {
    
    var apiClient: ContentAPIProtocol!
    var contents: [String] = []

    init(apiClient: ContentAPIProtocol) {
        self.apiClient = apiClient
    }
    
    func getTitle() -> String {
        return "Contents"
    }
    
    func numberOfItems() -> Int {
        return contents.count
    }
    
    func titleForCell(at indexPath: IndexPath) -> String {
        return contents[indexPath.row]
    }
    
    func getData() {
        apiClient.getContents() {[weak self] contentList in
            self?.contents = contentList
        }
    }
    
}
