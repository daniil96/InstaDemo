//
//  ProfileViewController.swift
//  InstaDemo
//
//  Created by A1 on 01.11.2024.
//

import UIKit

protocol ProfileDisplayLogic: AnyObject {
    // то что будет уметь view, например обновлять интерфейс
    func updateUI()
    func showError()
    func update(sections: [ProfileSection])
}

final class ProfileViewController: UIViewController {
    // обновление интерфейса и обработка событий
    var presenter: ProfilePresentationLogic?
    
    private var sections: [ProfileSection] = []
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self

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
        //убрать линии
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
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
        case let .accountInfo(model):
            let cell = tableView.dequeueReusableCell(type: AccountInfoTableViewCell.self, indexPath: indexPath)
            cell.configureCell(with: model)
            return cell
        case let .bio(model):
            let cell = tableView.dequeueReusableCell(type: BioTableViewCell.self, indexPath: indexPath)
            cell.configureCell(with: model)
            return cell
        case let .editProfile(model):
            let cell = tableView.dequeueReusableCell(type: EditProfileTableViewCell.self, indexPath: indexPath)
            cell.configureCell(with: model)
            return cell
        case let .stories(model):
            let cell = tableView.dequeueReusableCell(type: StoriesTableViewCell.self, indexPath: indexPath)
            cell.configureCell(with: model)
            return cell
        case let .tabs(model):
            let cell = tableView.dequeueReusableCell(type: TabsTableViewCell.self, indexPath: indexPath)
            cell.configureCell(with: model)
            return cell
        case let .posts(model):
            let cell = tableView.dequeueReusableCell(type: PostsTableViewCell.self, indexPath: indexPath)
            cell.configureCell(with: model)
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
