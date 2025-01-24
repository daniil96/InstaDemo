//
//  AuthDIContainer.swift
//  CoordinatorDemo
//
//  Created by A1 on 15.01.2025.
//

import UIKit

final class AuthDIContainer {
    func makeAuthViewController(router: AuthRoutingLogic) -> UIViewController {
        let authViewController = AuthViewController()
        let apiService = AuthAPIService()
        let presenter = AuthPresenter(apiService: apiService)
        authViewController.presenter = presenter
        presenter.viewController = authViewController
        presenter.router = router
        
        return authViewController
    }
    
    func makeCodeViewController(router: AuthRoutingLogic) -> UIViewController {
        let codeViewController = CodeViewController()
        codeViewController.router = router
        return codeViewController
    }
}
