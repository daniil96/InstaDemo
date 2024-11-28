//
//  ProfilePresenter.swift
//  InstaDemo
//
//  Created by A1 on 03.11.2024.
//

import Foundation
import UIKit

protocol ProfilePresentationLogic {
    func viewDidLoad()
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
                    ProfileSection(
                        type: .info,
                        rows: [
                            .navbar(NavbarTableViewCellModel(login: "Daniil", delegate: self)),
                            .accountInfo(AccountInfoTableViewCellModel(statistics: [
                                (type: .posts, value: 13),
                                (type: .followers, value: 101),
                                (type: .following, value: 11)
                            ])),
                            .bio(BioTableViewCellModel(
                                nickName: "Daniil Valerievich",
                                categiry: "Technology",
                                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt #hashtag",
                                link: "Link goes here")),
                            .editProfile(EditProfileTableViewCellModel(delegate: self)),
                            .stories(StoriesTableViewCellModel(nameStories: [
                                (type: "Add stories", image: UIImage(resource: .Icons.Stories.plus)),
                                (type: "Richard", image: UIImage(resource: .Icons.Stories.one)),
                                (type: "Funny", image: UIImage(resource: .Icons.Stories.two)),
                                (type: "Cute", image: UIImage(resource: .Icons.Stories.three)),
                             ]))
                        ]),
                    ProfileSection(
                        type: .posts,
                        rows: [
                            .tabs(TabsTableViewCellModel(delegate: self)),
                            .posts(PostsTableViewCellModel(nameImage: UIImage(resource: .avatarDran)))
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
}

extension ProfilePresenter: NavbarTableViewCellDelegate {
    func didTapAccountListButton() {
        print(#function)
    }
    
    func didTapMenuButton() {
        print(#function)
    }
}

extension ProfilePresenter: EditProfileTableViewCellDelegate {
    func didTapEditButton() {
        
    }
    
    func didTapSharetButton() {
        
    }
    
    func didTapCallButton() {
        
    }
}

extension ProfilePresenter: TabsTableViewCellDelegate {
    func didTapPostsButton() {
        
    }
    
    func didTapRealsButton() {
        
    }
    
    func didTapMentionsButton() {
        
    }
}
