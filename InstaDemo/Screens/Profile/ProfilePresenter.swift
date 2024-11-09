//
//  ProfilePresenter.swift
//  InstaDemo
//
//  Created by A1 on 03.11.2024.
//

import Foundation

protocol ProfilePresentationLogic {
    func viewDidLoad()
    func didTapButton()
}

final class ProfilePresenter {
    weak var viewController: ProfileDisplayLogic?
    
    private let apiService: APIServicable
    
    init(apiService: APIServicable ) {
        self.apiService = apiService
    }
}

extension ProfilePresenter: ProfilePresentationLogic {
    func viewDidLoad() {
        print(#function)
        
        apiService.fetchPosts { [weak self] result in
            guard let self else { return }
            
            switch result {
            case let .success(response):
                print(response.posts.count)
                self.viewController?.updateUI()
                
            case let .failure(error):
                print(error.localizedDescription)
                self.viewController?.showError()
            }
        }
    }
    
    func didTapButton() {
        print(#function)
        viewController?.showError()
    }
}


