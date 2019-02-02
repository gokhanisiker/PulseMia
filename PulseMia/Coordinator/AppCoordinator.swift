//
//  AppCoordinator.swift
//  PulseMia
//
//  Created by Gokhan Isiker on 02/02/2019.
//  Copyright © 2019 Gokhan Isiker. All rights reserved.
//

import UIKit

protocol AppCoordinatorProtocol {
    func start()
}

class AppCoordinator: AppCoordinatorProtocol {
    
    var rootViewController: UINavigationController!
    var apiEngine: APIEngine!
    let apiClient: ContentAPIClient!
    let window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
        self.apiEngine = APIEngine()
        self.apiClient = ContentAPIClient(apiEngine: apiEngine)
    }
    
    func start() {
        guard let window = window else { return }
        
        rootViewController = UINavigationController(rootViewController: getContentViewController())
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func getContentViewController() -> ContentViewController {
        let viewModel = ContentViewModel(apiClient: apiClient)
        let viewController = ContentViewController(viewModel: viewModel)
        viewController.delegate = self
        return viewController
    }
}

extension AppCoordinator: ContentViewControllerDelegate {
    
    func showDetails(of content: Content, from viewController: UIViewController) {
        let apiClient = ContentAPIClient(apiEngine: APIEngine())
        let viewModel = ContentDetailsViewModel(apiClient: apiClient, content: content)
        viewController.show(ContentDetailsViewController(viewModel: viewModel), sender: nil)
    }
    
}
