//
//  AuthCoordinator.swift
//  CoordinatorDemo
//
//  Created by A1 on 13.01.2025.
//

import Foundation

final class AuthCoordinator: Coordinator, CoordinatorOutput {
    var finishFlow: (() -> Void)?
    
    private let router: Routing
    private let diContainer: AuthDIContainer
    
    init(
        router: Routing,
        diContainer: AuthDIContainer = AuthDIContainer()
    ) {
        self.router = router
        self.diContainer = diContainer
    }
    
    func start() {
        let authViewController = diContainer.makeAuthViewController(router: self)
        router.setRoot(authViewController, animated: true)
    }
}

extension AuthCoordinator: AuthRoutingLogic {
    func showCodeScreen() {
        let codeViewController = diContainer.makeCodeViewController(router: self)
        router.push(codeViewController, animated: true)
    }
    
    func showMainScreen() {
        finishFlow?()
    }
}
