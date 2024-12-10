//
//  StoryColletionViewCell.swift
//  InstaDemo
//
//  Created by A1 on 30.11.2024.
//

import UIKit

final class StoryColletionViewCell: CollectionViewCell {
    private let storyHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 52/2

        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    func configureCell(with model: AddNewStoryCollectionViewCellModel) {
        titleLabel.text = model.title
//        imageView.image = UIImage(resource: .Icons.Stories.plus)
        imageView.image = UIImage(systemName: "plus")
    }
    
    func configureCell(with model: StoryCollectionViewCellModel) {
        titleLabel.text = model.title
        imageView.image = UIImage(systemName: "bell")
    }
    
    private func setupCell() {
    addSubviews()
    setLayout()
    }
    
    private func addSubviews() {
        contentView.addSubviews([
            storyHStack
        ])
        
        storyHStack.addArrangedSubviews([
            imageView,
            titleLabel
        ])
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            storyHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storyHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            storyHStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            storyHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: 52),
            imageView.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
}
