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
    }
    
    //    MARK: UI
    
    private func prepareUI() {
        title = viewModel.getTitle()
    }
    
    func registerCells() {
        collectionView.register(UINib(nibName: ContentCell.identifier, bundle: nil), forCellWithReuseIdentifier: ContentCell.identifier)
    }
    
    //    MARK: Data
    
    private func configureData() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension ContentViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCell.identifier, for: indexPath) as! ContentCell
        let content = viewModel.titleForCell(at: indexPath)
        cell.setup(with: content)
        return cell
    }
    
}
