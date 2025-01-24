//
//  AccountInfoTableViewCell.swift
//  InstaDemo
//
//  Created by A1 on 17.11.2024.
//

import UIKit

final class AccountInfoTableViewCell: TableViewCell {
    
    private let accountHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    private let avatarImageView: UIImageView = {
        let image = UIImage(resource: .avatarDran)
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 76/2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let statisticsHStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func configureCell(with model: AccountInfoTableViewCellModel) {
        statisticsHStackView.subviews.forEach { $0.removeFromSuperview() }
        
        model.statistics.forEach {
            let subview = makeStatisticSubview(type: $0.type, value: $0.value)
            statisticsHStackView.addArrangedSubview(subview)
        }
    }
    
    private func makeStatisticSubview(type: StatisticType, value: Int) -> UIView {
        let titleLabel = UILabel()
        let valueLabel = UILabel()
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .center
        stackView.distribution = .fillProportionally

        stackView.addArrangedSubviews([
            valueLabel,
            titleLabel
        ])
        
        titleLabel.text = type.title
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        valueLabel.text = "\(value)"
        valueLabel.font = UIFont.systemFont(ofSize: 14)
        
        return stackView
    }
    
    private func setupCell() {
        addSubviews()
        setupLayout()
    }
    
    private func addSubviews() {
        contentView.addSubviews([
            accountHStack
        ])
        accountHStack.addArrangedSubviews([
            avatarImageView,
            statisticsHStackView
        ])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            accountHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            accountHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            accountHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            accountHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            avatarImageView.heightAnchor.constraint(equalToConstant: 76),
            avatarImageView.widthAnchor.constraint(equalToConstant: 76)
        ])
    }
}
