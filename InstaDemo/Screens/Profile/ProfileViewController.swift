//
//  ProfileViewController.swift
//  InstaDemo
//
//  Created by A1 on 01.11.2024.
//

import UIKit

extension UITableViewCell {
    static var reuseID: String {
        String(describing: Self.self)
    }
}

extension UITableView {
    func register(type: UITableViewCell.Type) {
        register(type, forCellReuseIdentifier: type.reuseID)
    }
    
    func register(types: [UITableViewCell.Type]) {
        types.forEach { register(type: $0) }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseID, for: indexPath) as? T else {
            fatalError("Not found cell with reuseID: \(type.reuseID)")
        }
        return cell
    }
}

protocol ProfileDisplayLogic: AnyObject {
    // то что будет уметь view, например обновлять интерфейс
    func updateUI()
    func showError()
    func update(sections: [ProfileSection])
}

struct ProfileSection {
    let type: ProfileSectionType
    let rows: [ProfileRowsType]
}

enum ProfileSectionType {
    case info
    case posts
}

enum ProfileRowsType {
    case navbar(NavbarTableViewCellModel)
    case accountInfo
    case bio
    case editProfile
    case stories
    case tabs
    case posts
}

final class ProfileViewController: UIViewController {
    // обновление интерфейса и обработка событий
    var presenter: ProfilePresentationLogic?
    
    private var sections: [ProfileSection] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .gray
        tableView.showsVerticalScrollIndicator = false
        
        tableView.register(types: [
            NavbarTableViewCell.self,
            AccountInfoTableViewCell.self,
            BioTableViewCell.self,
            EditProfileTableViewCell.self,
            StoriesTableViewCell.self,
            TabsTableViewCell.self,
            PostsTableViewCell.self
        ])
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        presenter?.viewDidLoad()
    }
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowType = sections[indexPath.section].rows[indexPath.row]
        
        switch rowType {
        case let .navbar(model):
            let cell = tableView.dequeueReusableCell(type: NavbarTableViewCell.self, indexPath: indexPath)
            cell.configureCell(with: model)
            return cell
        case .accountInfo:
            let cell = tableView.dequeueReusableCell(type: AccountInfoTableViewCell.self, indexPath: indexPath)
            return cell
        case .bio:
            let cell = tableView.dequeueReusableCell(type: BioTableViewCell.self, indexPath: indexPath)
            return cell
        case .editProfile:
            let cell = tableView.dequeueReusableCell(type: EditProfileTableViewCell.self, indexPath: indexPath)
            return cell
        case .stories:
            let cell = tableView.dequeueReusableCell(type: StoriesTableViewCell.self, indexPath: indexPath)
            return cell
        case .tabs:
            let cell = tableView.dequeueReusableCell(type: TabsTableViewCell.self, indexPath: indexPath)
            return cell
        case .posts:
            let cell = tableView.dequeueReusableCell(type: PostsTableViewCell.self, indexPath: indexPath)
            return cell
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension ProfileViewController: ProfileDisplayLogic { 
    func updateUI() {
        print(#function)
    }
    
    func showError() {
        print(#function)
    }
    
    func update(sections: [ProfileSection]) {
        self.sections = sections
        tableView.reloadData()
    }
}
