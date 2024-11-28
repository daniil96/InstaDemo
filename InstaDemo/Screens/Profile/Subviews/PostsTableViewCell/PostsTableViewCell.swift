//
//  PostsTableViewCell.swift
//  InstaDemo
//
//  Created by A1 on 17.11.2024.
//

import UIKit

final class PostsTableViewCell: TableViewCell {
    
    private let postsUICollectionView: UICollectionView = {
        let postsCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        
        let image = UIImage()
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 76/2
        imageView.clipsToBounds = true
        
        return postsCollection
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        print(#function)
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func configureCell(with model: PostsTableViewCellModel) {
        print(#function)
    }
    
    private func setupCell() {
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        contentView.addSubviews([ postsUICollectionView ])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            postsUICollectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            postsUICollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postsUICollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            postsUICollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
}

extension PostsTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(PostsTableViewCellModel.self)", for: indexPath)
        return cell
    }
}
