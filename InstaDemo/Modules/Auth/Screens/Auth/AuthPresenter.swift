//
//  AuthPresenter.swift
//  CoordinatorDemo
//
//  Created by A1 on 15.01.2025.
//

import Foundation

protocol AuthPresentationLogic {
    func didTapButton()
}

final class AuthPresenter {
    weak var viewController: AuthDisplayLogic?
    var router: AuthRoutingLogic?
    
    private let apiService: AuthAPIService
    
    init(apiService: AuthAPIService) {
        self.apiService = apiService
    }
}

extension AuthPresenter: AuthPresentationLogic {
    func didTapButton() {
        Task {
            do {
                try await apiService.request()
                
                await MainActor.run {
                    router?.showCodeScreen()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
