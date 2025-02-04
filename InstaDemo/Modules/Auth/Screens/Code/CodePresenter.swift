//
//  CodePresenter.swift
//  InstaDemo
//
//  Created by A1 on 04.02.2025.
//

import Foundation

protocol CodePresentationLogic {
    func didTapSend(code: String)
}

final class CodePresenter {
    weak var viewController: CodeDisplayLogic?
    var router: CodeRoutingLogic?
    
    private let phone: String
    private let apiService: CodeAPIServicable
    
    init(
        phone: String,
        apiService: CodeAPIServicable
    ) {
        self.phone = phone
        self.apiService = apiService
    }
}

extension CodePresenter: CodePresentationLogic {
    func didTapSend(code: String) {
        viewController?.showLoading()
        Task {
            do {
                try await apiService.send(phone: phone, code: code)
                
                await MainActor.run {
                    viewController?.hideLoading()
                    router?.showMainScreen()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
