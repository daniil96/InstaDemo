//
//  StoriesTableViewCell.swift
//  InstaDemo
//
//  Created by A1 on 17.11.2024.
//

import UIKit

final class StoriesTableViewCell: TableViewCell {
    
    private let collectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 56, height: 82)
        layout.minimumLineSpacing = Constants.itemSpasing
        return layout
    }()
    
    private lazy var collectionView: CollectionView = {
        let collectionView = CollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(types: [
            StoryColletionViewCell.self
        ])
        return collectionView
    }()
    
    private var sections: [StoriesSection] = []
    private weak var delegate: StoriesColletionViewCellDelegate?
                                                       
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func configureCell(with model: StoriesTableViewCellModel) {
        sections = model.sections
        delegate = model.delegate
        collectionView.reloadData()
    }
    
    private func setupCell() {
    addSubviews()
    setLayout()
    }
    
    private func addSubviews() {
        contentView.addSubviews([
            collectionView
        ])
    }
    
    private func setLayout() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 98)
        ])
    }
}

extension StoriesTableViewCell: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let itemType = sections[indexPath.section].items[indexPath.item]
        let cell = collectionView.dequeueReusableCell(type: StoryColletionViewCell.self, indexPath: indexPath)
        
        switch itemType {
        case let .addNewStory(model):
            cell.configureCell(with: model)
        case let .story(model):
            cell.configureCell(with: model)
        }
        
        return cell
    }
}

extension StoriesTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemType = sections[indexPath.section].items[indexPath.item]
        
        switch itemType {
        case .addNewStory:
            delegate?.didTapAddNewStory(index: indexPath.item)
        case .story(_):
            delegate?.didTapStory(index: indexPath.item)
        }
    }
}

extension StoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch sections[section].type {
        case .addNew:
            UIEdgeInsets(top: 8, left: Constants.screenSpasing, bottom: 8, right: Constants.itemSpasing / 2)
        case .stories:
            UIEdgeInsets(top: 8, left: Constants.itemSpasing / 2, bottom: 8, right: Constants.screenSpasing)
        }
    }
}

extension StoriesTableViewCell {
    private enum Constants {
        static let itemSpasing: CGFloat = 22
        static let screenSpasing: CGFloat = 16
    }
}
