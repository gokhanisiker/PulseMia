//
//  ContentViewController.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 01/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import UIKit

protocol ContentViewControllerDelegate: class {
    func showDetails(of content: Content, from viewController: UIViewController)
}

class ContentViewController: UIViewController {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    var viewModel: ContentViewModel!
    weak var delegate: ContentViewControllerDelegate!
    private var dataSource: ContentDataSource?
    
    convenience init(viewModel: ContentViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    //    MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        registerCells()
        getContents()
    }
    
    //    MARK: UI
    
    private func prepareUI() {
        title = viewModel.getTitle()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
    }
    
    //    MARK: Data
    
    public func reloadData() {
        dataSource = viewModel.getDataSource { [weak self] (content) in
            self?.didSelect(content: content)
        }
        
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        collectionView.reloadData()
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
    
    private func didSelect(content: Content) {
        delegate.showDetails(of: content, from: self)
    }
    
    deinit {
        print("\(String(describing: self)) deinited")
    }
    
}
