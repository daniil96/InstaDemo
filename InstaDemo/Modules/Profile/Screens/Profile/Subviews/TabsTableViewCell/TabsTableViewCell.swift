//
//  TabsTableViewCell.swift
//  InstaDemo
//
//  Created by A1 on 17.11.2024.
//

import UIKit

final class TabsTableViewCell: TableViewCell {
    
    private let tabsHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 110
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var postsButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(resource: .ProfileIcons.Tabs.posts).withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var realsButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(resource: .ProfileIcons.Tabs.reals).withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapRealsButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var mentionsButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(resource: .ProfileIcons.Tabs.mentions).withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setBackgroundImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapMentionsButton), for: .touchUpInside)
        return button
    }()
    
    private weak var delegate: TabsTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        print(#function)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func configureCell(with model: TabsTableViewCellModel) {
        print(#function)
        delegate = model.delegate
    }
    
    private func setupCell() {
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        contentView.addSubviews([
            tabsHStack
        ])
        tabsHStack.addArrangedSubviews([
            postsButton,
            realsButton,
            mentionsButton
        ])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            tabsHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            tabsHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            tabsHStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            tabsHStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            postsButton.heightAnchor.constraint(equalToConstant: 24),
            postsButton.widthAnchor.constraint(equalToConstant: 24),
            
            realsButton.heightAnchor.constraint(equalToConstant: 24),
            realsButton.widthAnchor.constraint(equalToConstant: 24),
            
            mentionsButton.heightAnchor.constraint(equalToConstant: 24),
            mentionsButton.widthAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    @objc
    private func didTapPostsButton() {
        delegate?.didTapPostsButton()
    }
    
    @objc
    private func didTapRealsButton() {
        delegate?.didTapRealsButton()
    }
    
    @objc
    private func didTapMentionsButton() {
        delegate?.didTapMentionsButton()
    }
}
