//
//  ContentDetailsViewController.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 02/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import UIKit

class ContentDetailsViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    var viewModel: ContentDetailsViewModel!
    
    convenience init(viewModel: ContentDetailsViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    //    MARK: LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareUI()
        getContentDetails()
    }
    
    //    MARK: UI
    
    private func prepareUI() {
        title = viewModel.getTitle()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 200
        tableView.register(cell: ContentDetailsHeaderCell.self)
    }
    
    public func reloadData() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    //    MARK: Data
    
    private func getContentDetails() {
        viewModel.getData { [weak self] in
            DispatchQueue.main.async {
                self?.reloadData()
            }
        }
    }

    deinit {
        print("\(String(describing: self)) deinited")
    }
}

extension ContentDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentDetailsHeaderCell.identifier, for: indexPath) as! ContentDetailsHeaderCell
        cell.setup(with: viewModel.getContentDetatils())
        return cell
    }
    
}
