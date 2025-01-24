//
//  AuthViewController.swift
//  CoordinatorDemo
//
//  Created by A1 on 13.01.2025.
//

import UIKit

protocol AuthDisplayLogic: AnyObject {
    
}

final class AuthViewController: UIViewController {
    var presenter: AuthPresentationLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        
        let textField = UITextField(frame: .init(origin: .zero, size: .init(width: 300, height: 50)))
        textField.text = "Auth"
        textField.center = view.center
        view.addSubview(textField)
        
        let button = UIButton(type: .system)
        button.setTitle("show Code screen", for: .normal)
        button.addTarget(self, action: #selector(pushCodeVC), for: .touchUpInside)
        button.frame = .init(origin: .zero, size: .init(width: 300, height: 50))
        button.center = view.center
        view.addSubview(button)
    }
    
    @objc
    func pushCodeVC() {
        presenter?.didTapButton()
    }
}

extension AuthViewController: AuthDisplayLogic {
    
}
