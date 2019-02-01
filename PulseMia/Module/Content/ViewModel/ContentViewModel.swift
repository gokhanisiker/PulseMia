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
    var contents: [Content] = []

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
        return contents[indexPath.row].title
    }
    
    func getData(completion: @escaping () -> Void) {
        apiClient.getContents { [weak self] (contents, error) in
            if error == nil {
                self?.contents = contents
            }
            completion()
        }
    }
    
}
