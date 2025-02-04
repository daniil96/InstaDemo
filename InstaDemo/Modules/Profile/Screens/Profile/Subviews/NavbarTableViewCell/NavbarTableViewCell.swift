//
//  NavbarTableViewCell.swift
//  InstaDemo
//
//  Created by A1 on 15.11.2024.
//

import UIKit

final class NavbarTableViewCell: TableViewCell {
    private let infoHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        
        return stackView
    }()
    
    private let lockImageView: UIImageView = {
        let image = UIImage(resource: .ProfileIcons.NavBar.lock)
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var accountListButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(resource: .ProfileIcons.NavBar.accountsList).withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapAccountListButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var menuButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(resource: .ProfileIcons.NavBar.menu).withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(didTapMenuButton), for: .touchUpInside)
        return button
    }()
    
    private weak var delegate: NavbarTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        print(#function)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func configureCell(with model: NavbarTableViewCellModel) {
        print(#function)
        titleLable.text = model.login
        delegate = model.delegate
    }
    
    private func setupCell() {
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        contentView.addSubviews([
            infoHStackView,
            menuButton
        ])
        infoHStackView.addArrangedSubviews([
            lockImageView,
            titleLable,
            accountListButton
        ])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            infoHStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            infoHStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            menuButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            menuButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            menuButton.widthAnchor.constraint(equalToConstant: 21),
            menuButton.heightAnchor.constraint(equalToConstant: 18),
            
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 44)
        ])
    }
    
    @objc
    private func didTapAccountListButton() {
        delegate?.didTapAccountListButton()
    }
    
    @objc
    private func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }
}
