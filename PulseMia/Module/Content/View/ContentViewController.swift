//
//  ContentViewController.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel: ContentViewModel!
    
    convenience init(viewModel: ContentViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    //    MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        configureData()
        registerCells()
        getContents()
    }
    
    //    MARK: UI
    
    private func prepareUI() {
        title = viewModel.getTitle()
    }
    
    private func reloadData() {
        collectionView.reloadData()
    }
    
    //    MARK: Data
    
    private func configureData() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func registerCells() {
        collectionView.register(ContentCell.self)
    }
    
    private func getContents() {
        viewModel.getData { [weak self] in
            DispatchQueue.main.async {
                self?.reloadData()
            }
        }
    }
    
}

extension ContentViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCell.identifier, for: indexPath) as! ContentCell
        let content = viewModel.getContent(at: indexPath)
        cell.setup(with: content)
        return cell
    }
    
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
