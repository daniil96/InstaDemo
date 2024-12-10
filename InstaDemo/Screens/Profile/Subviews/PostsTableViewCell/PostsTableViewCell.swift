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
        layout.itemSize = CGSize(width: 126, height: 126)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
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
    
    private var sections: [PostsSection] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func configureCell(with model: PostsTableViewCellModel) {
        sections = model.sections
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
            collectionView.heightAnchor.constraint(equalToConstant: 128)
        ])
    }
}

extension PostsTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemType = sections[indexPath.section].items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(type: PostColletionViewCell.self, indexPath: indexPath)
        
        switch itemType {
        case let .post(model):
            cell.configureCell(with: model)
        }
        
        return cell
    }}

extension PostsTableViewCell: UICollectionViewDelegate {
    
}
