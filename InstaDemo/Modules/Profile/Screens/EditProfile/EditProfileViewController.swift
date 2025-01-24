//
//  EditProfileViewController.swift
//  CoordinatorDemo
//
//  Created by A1 on 13.01.2025.
//

import UIKit

final class EditProfileViewController: UIViewController {
    var router: ProfileRoutingLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        let textField = UITextField(frame: .init(origin: .zero, size: .init(width: 300, height: 50)))
        textField.text = "Edit Profile"
        textField.center = view.center
        view.addSubview(textField)
        
        let button = UIButton(type: .system)
        button.setTitle("show Auth screen", for: .normal)
        button.addTarget(self, action: #selector(pushAuthVC), for: .touchUpInside)
        button.frame = .init(origin: .zero, size: .init(width: 300, height: 50))
        button.center = view.center
        view.addSubview(button)
    }
    
    @objc
    func pushAuthVC() {
        router?.showAuthScreen()
    }
}
