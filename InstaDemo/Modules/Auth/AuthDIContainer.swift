//
//  AuthDIContainer.swift
//  CoordinatorDemo
//
//  Created by A1 on 15.01.2025.
//

import UIKit

final class AuthDIContainer {
    private let apiService: AuthAPIServicable & CodeAPIServicable
    
    init(decoderService: DecoderServicable, networkService: NetworkServicable) {
        self.apiService = AuthAPIService(
            decoderService: decoderService,
            networkService: networkService
        )
    }
    
    func makeAuthViewController(router: AuthRoutingLogic) -> UIViewController {
        let viewController = AuthViewController()
        let apiService = apiService
        let presenter = AuthPresenter(apiService: apiService)
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.router = router
        
        return viewController
    }
    
    func makeCodeViewController(router: CodeRoutingLogic, phone: String) -> UIViewController {
        let viewController = CodeViewController()
        let presenter = CodePresenter(phone: phone, apiService: apiService)
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.router = router
        
        return viewController
    }
}
