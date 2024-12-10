//
//  PostColletionViewCell.swift
//  InstaDemo
//
//  Created by A1 on 07.12.2024.
//

import UIKit

final class PostColletionViewCell: CollectionViewCell {
    private let postHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
//        stackView.spacing = 16
        return stackView
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .lightGray

        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    func configureCell(with model: PostCollectionViewCellModel) {
        imageView.image = UIImage(systemName: "bell")
    }
    
    private func setupCell() {
    addSubviews()
    setLayout()
    }
    
    private func addSubviews() {
        contentView.addSubviews([
            postHStack
        ])
        
        postHStack.addArrangedSubviews([
            imageView
        ])
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            postHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            postHStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            postHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            imageView.widthAnchor.constraint(equalToConstant: 126),
            imageView.heightAnchor.constraint(equalToConstant: 126),
        ])
    }
}
