//
//  ProfilePresenter.swift
//  InstaDemo
//
//  Created by A1 on 03.11.2024.
//

import Foundation
//import UIKit

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
                            .stories(StoriesTableViewCellModel(sections: [
                                StoriesSection(
                                    type: .addNew,
                                    items: [.addNewStory(AddNewStoryCollectionViewCellModel(title: "Add new"))]),
                                StoriesSection(
                                    type: .stories,
                                    items: [
                                        StoriesItemType.story(StoryCollectionViewCellModel(title: "Хищник")),
                                        StoriesItemType.story(StoryCollectionViewCellModel(title: "Чужой")),
                                        StoriesItemType.story(StoryCollectionViewCellModel(title: "Атака")),
                                        StoriesItemType.story(StoryCollectionViewCellModel(title: "Титан")),
                                        StoriesItemType.story(StoryCollectionViewCellModel(title: "Рыцарь")),
                                        StoriesItemType.story(StoryCollectionViewCellModel(title: "Змеюка")),
                                    ]
                                )
                            ], delegate: self)
                            )
                        ]),
                    ProfileSection(
                        type: .posts,
                        rows: [
                            .tabs(TabsTableViewCellModel(delegate: self)),
                            .posts(PostsTableViewCellModel(
                                posts: [
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150"),
                                    PostCollectionViewCellModel(urlString: "https://dummyjson.com/image/150")
                                ]
                            )
                            )
                        ]
                    )
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
        print(#function)
    }
    
    func didTapRealsButton() {
        print(#function)
    }
    
    func didTapMentionsButton() {
        print(#function)
    }
}

extension ProfilePresenter: StoriesColletionViewCellDelegate {
    func didTapAddNewStory(index: Int) {
        print(#function, index)
    }
    
    func didTapStory(index: Int) {
        print(#function, index)
    }
}
