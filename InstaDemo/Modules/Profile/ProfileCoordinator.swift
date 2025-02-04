//
//  ProfileCoordinator.swift
//  CoordinatorDemo
//
//  Created by A1 on 13.01.2025.
//

import Foundation

final class ProfileCoordinator: Coordinator, CoordinatorOutput {
    var presenter: ProfilePresentationLogic?
    var finishFlow: (() -> Void)?
    
    private let router: Routing
    private let diContainer: ProfileDIContainer
    private let defaultsService = UserDefaultsService()
    
    init(
        router: Routing,
        diContainer: ProfileDIContainer = ProfileDIContainer()
    ) {
        self.router = router
        self.diContainer = diContainer
    }
    
    func start() {
        let profileViewController = diContainer.makeProfileViewController(router: self)
        router.push(profileViewController, animated: true)
    }
}

extension ProfileCoordinator: ProfileRoutingLogic {
    func showEditProfileScreen() {
        let editProfileViewController = diContainer.makeEditProfileViewController(router: self)
        router.push(editProfileViewController, animated: true)
    }
    
    func showAuthScreen() {
        finishFlow?()
        defaultsService.set(value: false, for: .isUserAuth)
    }
}
