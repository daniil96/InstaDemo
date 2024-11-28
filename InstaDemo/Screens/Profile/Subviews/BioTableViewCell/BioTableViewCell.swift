//
//  BioTableViewCell.swift
//  InstaDemo
//
//  Created by A1 on 17.11.2024.
//

import UIKit

final class BioTableViewCell: TableViewCell {
        
    private let bioVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        return stackView
    }()
    
    private let nickNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        var label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.numberOfLines = 2
        return label
    }()
    
    private let linkLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        print(#function)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func configureCell(with model: BioTableViewCellModel) {
        print(#function)
        nickNameLabel.text = model.nickName
        categoryLabel.text = model.categiry
        descriptionLabel.text = model.description
        linkLabel.text = model.link
    }
    
    private func setupCell() {
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        contentView.addSubviews([bioVStack])
        bioVStack.addArrangedSubviews([
            nickNameLabel,
            categoryLabel,
            descriptionLabel,
            linkLabel
        ])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            bioVStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            bioVStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bioVStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            bioVStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}
