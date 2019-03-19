//
//  ContentDataSource.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 02/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import UIKit

class ContentDataSource: NSObject {
    
    typealias ContentDidSelectItemHandler = (Content) -> ()
    
    var contents: [Content] = []
    var didSelectItemHandler: ContentDidSelectItemHandler
    
    init(with contents: [Content], didSelectItemHandler: @escaping ContentDidSelectItemHandler) {
        self.contents = contents
        self.didSelectItemHandler = didSelectItemHandler
    }
}


extension ContentDataSource: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCell.identifier, for: indexPath) as! ContentCell
        let content = contents[indexPath.row]
        cell.setup(with: content)
        return cell
    }
    
}

extension ContentDataSource: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let content = contents[indexPath.row]
        didSelectItemHandler(content)
    }
    
}

extension ContentDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - CGFloat(AppConstants.ContentCollection.HorizontalSpaceBetweenItems * 3)) / 2
        return CGSize(width: width, height: width * CGFloat(AppConstants.ContentCollection.PosterImageRatio))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(AppConstants.ContentCollection.VerticleSpaceBetweenItems)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(AppConstants.ContentCollection.HorizontalSpaceBetweenItems) / 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let leftMargin = CGFloat(AppConstants.ContentCollection.HorizontalSpaceBetweenItems)
        let topMargin = CGFloat(AppConstants.ContentCollection.VerticleSpaceBetweenItems)
        return UIEdgeInsetsMake(topMargin, leftMargin, topMargin, leftMargin)
    }
    
}

