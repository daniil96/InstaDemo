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
        diContainer: AuthDIContainer
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
    func showCodeScreen(phone: String) {
        let codeViewController = diContainer.makeCodeViewController(router: self, phone: phone)
        router.push(codeViewController, animated: true)
    }
    
    // TODO: -
    func showMainScreen() {
        finishFlow?()
    }
}

extension AuthCoordinator: CodeRoutingLogic {
    
}
