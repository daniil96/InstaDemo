//
//  ProfileDIContainer.swift
//  InstaDemo
//
//  Created by A1 on 22.01.2025.
//

import UIKit

final class ProfileDIContainer {
    func makeProfileViewController(router: ProfileRoutingLogic) -> UIViewController {
        let decoderService = DecoderService()
        let networkService = NetworkService()
        
        let profileViewController = ProfileViewController()
        let apiService = APIService(decoderService: decoderService, networkService: networkService)
        let presenter = ProfilePresenter(apiService: apiService)
        
        profileViewController.presenter = presenter
        presenter.viewController = profileViewController
        presenter.router = router
        
        return profileViewController
    }
    
    func makeEditProfileViewController(router: ProfileRoutingLogic) -> UIViewController {
        let editProfileViewController = EditProfileViewController()
        editProfileViewController.router = router
        
        return editProfileViewController
    }
}
