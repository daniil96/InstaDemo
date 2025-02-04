//
//  AuthViewController.swift
//  CoordinatorDemo
//
//  Created by A1 on 13.01.2025.
//

import UIKit

protocol AuthDisplayLogic: AnyObject {
    func showLoading()
    func hideLoading()
}

final class AuthViewController: UIViewController {
    var presenter: AuthPresentationLogic?
    
    private let AuthVStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        return stackView
    }()
    
    private let logoImageView: UIImageView = {
        let image = UIImage(resource: .AuthIcons.logo)
        let imageView = UIImageView(image: image)
        imageView.frame = .init(origin: .zero, size: .init(width: 150, height: 100))
        return imageView
    }()

    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.text = "  login"
        textField.textColor = .lightText
        
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = CGFloat( 13 )
        
        textField.frame = .init(origin: .zero, size: .init(width: 300, height: 80))
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.text = "  password"
        textField.textColor = .lightText

        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = CGFloat( 13 )
        
        textField.frame = .init(origin: .zero, size: .init(width: 300, height: 80))
        return textField
    }()
    
    let AuthButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("show Code screen", for: .normal)
        button.addTarget(self, action: #selector(pushCodeVC), for: .touchUpInside)
        button.frame = .init(origin: .zero, size: .init(width: 300, height: 50))
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
                
        view.addSubviews([AuthVStack])
        AuthVStack.addArrangedSubviews([
            logoImageView,
            loginTextField,
            passwordTextField,
            AuthButton
        ])
        
        setupLayout()
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            AuthVStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            AuthVStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            AuthVStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            AuthVStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            
            logoImageView.topAnchor.constraint(equalTo: AuthVStack.topAnchor),
            logoImageView.leadingAnchor.constraint(equalTo: AuthVStack.leadingAnchor),
            logoImageView.trailingAnchor.constraint(equalTo: AuthVStack.trailingAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: AuthVStack.centerXAnchor),  
        ])
    }
    
    @objc
    func pushCodeVC() {
        presenter?.didTapSend(phone: "+7-800-555-35-55")
    }
}

extension AuthViewController: AuthDisplayLogic {
    func hideLoading() {
        print(#function)
    }
    
    func showLoading() {
        print(#function)
    }
}
