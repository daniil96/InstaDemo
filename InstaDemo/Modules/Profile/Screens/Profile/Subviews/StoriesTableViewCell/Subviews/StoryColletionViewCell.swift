//
//  StoryColletionViewCell.swift
//  InstaDemo
//
//  Created by A1 on 30.11.2024.
//

import UIKit

final class StoryColletionViewCell: CollectionViewCell {
    private let storyVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4
        return stackView
    }()

    private let imageView: AsyncImageView = {
        let imageView = AsyncImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray
        imageView.layer.cornerRadius = 56/2

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
//        imageView.image = UIImage(resource: .ProfileIcons.Stories.plus)
        imageView.image = UIImage(systemName: "plus")
    }
    
    func configureCell(with model: StoryCollectionViewCellModel) {
        titleLabel.text = model.title
        let url = URL(string: model.urlString)
        imageView.set(url: url)
    }
    
    private func setupCell() {
    addSubviews()
    setLayout()
    }
    
    private func addSubviews() {
        contentView.addSubviews([
            storyVStack
        ])
        
        storyVStack.addArrangedSubviews([
            imageView,
            titleLabel
        ])
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            storyVStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            storyVStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            storyVStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            storyVStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: 56),
            imageView.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
