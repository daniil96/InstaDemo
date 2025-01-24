//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by A1 on 13.01.2025.
//

import Foundation

final class MainCoordinator: Coordinator, CoordinatorOutput {
    var finishFlow: (() -> Void)?
    
    private let router: Routing
    
    init(router: Routing) {
        self.router = router
    }
    
    func start() {
        let mainViewControler = MainViewController()
        mainViewControler.router = self
        router.setRoot(mainViewControler, animated: true)
    }
    
    private func startProfileFlow() {
        let coordinator = ProfileCoordinator(router: router)
        coordinator.finishFlow = { [ unowned self ] in
            finishFlow?()
        }
        coordinator.start()
    }
}

extension MainCoordinator: MainRoutingLogic {
    func showDetailsScreen() {
        let detailsViewController = DetailsViewController()
        detailsViewController.router = self
        router.push(detailsViewController, animated: true)
    }
    
    func showProfileScreen() {
        startProfileFlow()
    }
}
