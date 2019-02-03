//
//  ContentViewModel.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import Foundation

protocol ContentViewModelProtocol {
    
    func getTitle() -> String
    func numberOfItems() -> Int
    func titleForCell(at indexPath: IndexPath) -> String
    func getContent(at indexPath: IndexPath) -> Content
    func getData(completion: @escaping () -> Void)
    func getDataSource(didSelectItemHandler: @escaping ContentDataSource.ContentDidSelectItemHandler) -> ContentDataSource
    
}

class ContentViewModel: ContentViewModelProtocol {
    
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
    
    func getContent(at indexPath: IndexPath) -> Content {
        return contents[indexPath.row]
    }
    
    func getData(completion: @escaping () -> Void) {
        apiClient.getContents { [weak self] (contents, error) in
            if error == nil {
                self?.contents = contents
            }
            completion()
        }
    }
    
    func getDataSource(didSelectItemHandler: @escaping ContentDataSource.ContentDidSelectItemHandler) -> ContentDataSource {
        return ContentDataSource(with: contents, didSelectItemHandler: didSelectItemHandler)
    }
    
}
