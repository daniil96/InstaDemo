//
//  ProfilePresenter.swift
//  InstaDemo
//
//  Created by A1 on 03.11.2024.
//

import Foundation

protocol ProfileRoutingLogic: AnyObject {
    func push()
    func pop()
}

protocol ProfilePresentationLogic {
    func viewDidLoad()
}

final class ProfilePresenter {
    
    weak var viewController: ProfileDisplayLogic?
    var router: ProfileRoutingLogic?
    
    private let apiService: APIServicable
    
    private var posts: [PostModel] = []
    private var stories: [StoryModel] = []
    
    init(apiService: APIServicable ) {
        self.apiService = apiService
    }
}

extension ProfilePresenter {
    private func makeAccountInfoRow() -> ProfileRowsType {
        let viewModel = AccountInfoTableViewCellModel(statistics: [
            (type: .posts, value: posts.count),
            (type: .followers, value: 101),
            (type: .following, value: 11)])
        return ProfileRowsType.accountInfo(viewModel)
    }
    
    private func makeBioRow() -> ProfileRowsType {
        let viewModel = BioTableViewCellModel(
            nickName: "Daniil Valerievich",
            categiry: "Technology",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt #hashtag",
            link: "Link goes here"
        )
        return ProfileRowsType.bio(viewModel)
    }
    
    private func makeStoriesSection() -> ProfileSection {
        let items = stories.map {
            let viewModel = StoryCollectionViewCellModel(model: $0)
            return StoriesItemType.story(viewModel)
        }
        
        return  ProfileSection(
            type: .stories,
            rows: [
                .stories(
                    StoriesTableViewCellModel(
                        sections: [
                            StoriesSection(
                                type: .addNew,
                                items: [.addNewStory(AddNewStoryCollectionViewCellModel(title: "Add new"))]),
                            StoriesSection(
                                type: .stories,
                                items: items
                            )
                        ],
                        delegate: self
                    )
                )
            ]
        )
    }
    
    private func makePostsSection() -> ProfileSection {
        let rows = posts.map { PostCollectionViewCellModel(model: $0) }
        let viewModel = PostsTableViewCellModel(posts: rows)
        return ProfileSection(type: .posts, rows: [.posts(viewModel)])
    }
    
    private func makeSections() -> [ProfileSection] {
        [
            ProfileSection(
                type: .info,
                rows: [
                    .navbar(NavbarTableViewCellModel(login: "Daniil", delegate: self)),
                    makeAccountInfoRow(),
                    makeBioRow(),
                    .editProfile(EditProfileTableViewCellModel(delegate: self)),
                ]),
            makeStoriesSection(),
            
            ProfileSection(
                type: .tabs,
                rows: [.tabs(TabsTableViewCellModel(delegate: self))]
            ),
            makePostsSection()
        ]
    }
}

extension ProfilePresenter: ProfilePresentationLogic {
    func viewDidLoad() {
        print(#function)
        
        Task(priority: .utility) {
            do {
                let response = try await apiService.fetchPosts()
                
                posts = response.posts.map { PostModel(response: $0 )}
                stories = response.posts.compactMap { StoryModel(response: $0) }
                
                let sections = makeSections()
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
    
    func pullToRefresh() {

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
        router?.pop()
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
