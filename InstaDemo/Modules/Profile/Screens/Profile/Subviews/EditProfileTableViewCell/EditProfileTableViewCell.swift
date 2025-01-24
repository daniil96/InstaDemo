//
//  EditProfileTableViewCell.swift
//  InstaDemo
//
//  Created by A1 on 17.11.2024.
//

import UIKit

final class EditProfileTableViewCell: TableViewCell {
    
    private let editHStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        return stackView
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        
        button.setTitle("Edit", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        
        button.addTarget(self, action: #selector(didTapEditButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        
        button.setTitle("Share", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        
        button.addTarget(self, action: #selector(didTapSharetButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var callButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 10
        
        button.setTitle("Call", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 13)
        
        button.addTarget(self, action: #selector(didTapCallButton), for: .touchUpInside)
        return button
    }()
    
    private weak var delegate: EditProfileTableViewCellDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    func configureCell(with model: EditProfileTableViewCellModel) {
        delegate = model.delegate
    }
    
    private func setupCell() {
        addSubwiews()
        setupLayout()
    }
    
    private func addSubwiews() {
        contentView.addSubviews([
            editHStack
        ])
        editHStack.addArrangedSubviews([
            editButton,
            shareButton,
            callButton
        ])
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            editHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            editHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            editHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            editHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            editButton.heightAnchor.constraint(equalToConstant: 30),
            editButton.widthAnchor.constraint(equalToConstant: 105),
            
            shareButton.heightAnchor.constraint(equalToConstant: 30),
            shareButton.widthAnchor.constraint(equalToConstant: 105),
            
            callButton.heightAnchor.constraint(equalToConstant: 30),
            callButton.widthAnchor.constraint(equalToConstant: 105),
        ])
    }
    
    @objc
    private func didTapEditButton() {
        delegate?.didTapEditButton()
    }
    
    @objc
    private func didTapSharetButton() {
        delegate?.didTapSharetButton()
    }
    
    @objc
    private func didTapCallButton() {
        delegate?.didTapCallButton()
    }
}
