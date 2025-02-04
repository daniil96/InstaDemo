//
//  AuthPresenter.swift
//  CoordinatorDemo
//
//  Created by A1 on 15.01.2025.
//

import Foundation

protocol AuthPresentationLogic {
    func didTapSend(phone: String)
}

final class AuthPresenter {
    weak var viewController: AuthDisplayLogic?
    var router: AuthRoutingLogic?
    
    private let apiService: AuthAPIServicable
    
    init(apiService: AuthAPIServicable) {
        self.apiService = apiService
    }
}

extension AuthPresenter: AuthPresentationLogic {
    func didTapSend(phone: String) {
        viewController?.showLoading()
        Task {
            do {
                try await apiService.send(phone: phone)
                
                await MainActor.run {
                    viewController?.hideLoading()
                    router?.showCodeScreen(phone: phone)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
