//
//  AppCoordinator.swift
//  InstaDemo
//
//  Created by A1 on 24.12.2024.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    private let router: Routing
    private let window: UIWindow
    private let diContainer = AppDIContainer()
        
    init(window: UIWindow) {
        let navigationController = UINavigationController()
        
        router = Router(navigationController: navigationController)
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        self.window = window
    }
    
    override func start() {
        let isUserAuth = diContainer.defaultsService.fetch(for: .isUserAuth)
        print(isUserAuth)
        if isUserAuth {
            startMainFlow()
        } else {
            startAuthFlow()
        }
    }
    
    private func startAuthFlow() {
        let authDIContainer = AuthDIContainer(
            decoderService: diContainer.decoderService,
            networkService: diContainer.networkService
        )
        let authCoordinator = AuthCoordinator(router: router, diContainer: authDIContainer)
        authCoordinator.finishFlow = { [ unowned self ] in
            diContainer.defaultsService.set(value: true, for: .isUserAuth)
            startMainFlow()
        }
        authCoordinator.start()
    }
    
    private func startMainFlow() {
        let mainCoordinator = MainCoordinator(router: router)
        mainCoordinator.finishFlow = { [ unowned self ] in
//            defaultsService.set(value: false, for: .isUserAuth)
            startAuthFlow()
//            startProfileFlow()
        }
        mainCoordinator.start()
    }
    
//    private func startProfileFlow() {
//        let profileCoordinator = ProfileCoordinator(router: router)
//        profileCoordinator.finishFlow = { [ unowned self ] in
//            defaultsService.set(value: false, for: .isUserAuth)
//            startAuthFlow()
//        }
//        profileCoordinator.start()
//    }
}

// Ввод телефона -> Ввод кода -> Домой ->
