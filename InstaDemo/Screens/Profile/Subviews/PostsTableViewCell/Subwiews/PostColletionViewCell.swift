//
//  PostColletionViewCell.swift
//  InstaDemo
//
//  Created by A1 on 07.12.2024.
//

import UIKit

final class AsyncImageView: UIImageView {
    private let networkSrvice: NetworkServiceable = NetworkService()
    
    private var url: URL?
    
    func set(url: URL) {
        backgroundColor = .blue
        Task(priority: .utility) {
            do {
                let urlRequest = URLRequest(url: url)
                let data = try await networkSrvice.request(urlRequest: urlRequest)
                await MainActor.run {
                    image = UIImage(data: data)
                }
            } catch {
                await MainActor.run {
                    backgroundColor = .red
                }
            }
        }
    }
}

final class PostColletionViewCell: CollectionViewCell {
    private let postHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()

    private let imageView: AsyncImageView = {
        let imageView = AsyncImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.backgroundColor = .lightGray

        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }
    
    func configureCell(with model: PostCollectionViewCellModel) {
        guard let url = URL(string: model.urlString) else {
            return
        }
        imageView.set(url: url)
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
            postHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
