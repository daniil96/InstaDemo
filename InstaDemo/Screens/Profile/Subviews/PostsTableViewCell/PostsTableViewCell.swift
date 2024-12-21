//
//  PostsTableViewCell.swift
//  InstaDemo
//
//  Created by A1 on 17.11.2024.
//

import UIKit

final class PostsTableViewCell: TableViewCell {
    
    private let collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = CGFloat(Constants.postsSpacing)
        layout.minimumInteritemSpacing = CGFloat(Constants.postsSpacing)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return layout
    }()
    
    private lazy var collectionView: CollectionView = {
        let collectionView = CollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(types: [
            PostColletionViewCell.self,
            UICollectionViewCell.self
        ])
        return collectionView
    }()
    
    private var posts: [PostCollectionViewCellModel] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func configureCell(with model: PostsTableViewCellModel) {
        posts = model.posts
//        delegate = model.delegate
        collectionView.reloadData()
    }
    
    private func setupCell() {
    addSubviews()
    setupLayout()
    }
    
    private func addSubviews() {
        contentView.addSubviews([
            collectionView
        ])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}

extension PostsTableViewCell: UICollectionViewDataSource {
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        sections.count
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: PostColletionViewCell.self, indexPath: indexPath)
        let model = posts[indexPath.item]
        cell.configureCell(with: model)

        return cell
    }}

extension PostsTableViewCell: UICollectionViewDelegate {
}

extension PostsTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.width
        let size = (collectionViewWidth - (CGFloat((Constants.postElements - 1)) * Constants.postsSpacing)) / CGFloat(Constants.postElements)
        return CGSize(width: size, height: size)
    }
}

extension PostsTableViewCell {
    enum Constants {
        static let postElements: Int = 3
        static let postsSpacing: CGFloat = 1
    }
}
