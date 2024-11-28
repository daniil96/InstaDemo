//
//  StoriesTableViewCell.swift
//  InstaDemo
//
//  Created by A1 on 17.11.2024.
//

import UIKit

final class StoriesTableViewCell: TableViewCell {
    
    private let storiesHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func configureCell(with model: StoriesTableViewCellModel) {
        storiesHStack.subviews.forEach { $0.removeFromSuperview() }
        
        model.nameStories.forEach {
            let subview = makeStoriesSubview(type: $0.type, image: $0.image)
            storiesHStack.addArrangedSubview(subview)
        }
    }
    
    private func makeStoriesSubview(type: String, image: UIImage) -> UIView {
        let storiesImage = UIImageView(image: image)
        let storiesNameLabel = UILabel()
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.distribution = .fillProportionally

        stackView.addArrangedSubviews([
            storiesImage,
            storiesNameLabel
        ])
        
        storiesImage.layer.name = "\(image)"
        storiesImage.contentMode = .scaleToFill
        storiesImage.layer.cornerRadius = 52/2
        storiesImage.clipsToBounds = true
        storiesImage.translatesAutoresizingMaskIntoConstraints = false
        
        storiesNameLabel.text = type
        storiesNameLabel.font = UIFont.systemFont(ofSize: 12)
        
//        NSLayoutConstraint.activate([
//            storiesImage.widthAnchor.constraint(equalToConstant: 52),
//            storiesImage.heightAnchor.constraint(equalToConstant: 52),
//            storiesNameLabel.widthAnchor.constraint(equalToConstant: 53),
//            storiesNameLabel.heightAnchor.constraint(equalToConstant: 14)
//        ])
        
        return stackView
    }
    
    private func setupCell() {
        addSubviews()
        setLayout()
    }
    
    private func addSubviews() {
        contentView.addSubviews([
            storiesHStack
        ])
//        storiesHStack.addArrangedSubviews([
//
//        ])
    }

    private func setLayout() {
        NSLayoutConstraint.activate([
            storiesHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            storiesHStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            storiesHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            storiesHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
//            storiesImage.widthAnchor.constraint(equalToConstant: 52),
//            storiesImage.heightAnchor.constraint(equalToConstant: 52),
        ])
    }
}
