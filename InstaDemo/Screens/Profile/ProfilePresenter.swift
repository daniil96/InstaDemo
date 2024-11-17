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
        
        Task(priority: .utility) {
            do {
                let response = try await apiService.fetchPosts()
                let sections = [
                    ProfileSection(type: .info, rows: [
                        .navbar(NavbarTableViewCellModel(nickNamme: "Daniil")),
                        .accountInfo,
                        .bio,
                        .stories,
                        .editProfile,
                        .stories
                    ]),
                    ProfileSection(type: .posts, rows: [
                        .tabs,
                        .posts
                    ])
                ]
                await MainActor.run {
                    viewController?.update(sections: sections)
                }
            } catch {
                await MainActor.run {
                    viewController?.showError()
                }
            }
        }
    }
    
    func didTapButton() {
        print(#function)
        viewController?.showError()
    }
}


