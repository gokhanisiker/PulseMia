//
//  ContentDetailsViewController.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 02/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import UIKit

class ContentDetailsViewController: UIViewController {

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
    }
    
    private func reloadPage() {
        
    }
    
    //    MARK: Data
    
    private func getContentDetails() {
        viewModel.getData { [weak self] in
            DispatchQueue.main.async {
                self?.reloadPage()
            }
        }
    }

}

extension ContentDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
