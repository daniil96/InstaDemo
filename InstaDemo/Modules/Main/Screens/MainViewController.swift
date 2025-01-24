//
//  MainViewController.swift
//  CoordinatorDemo
//
//  Created by A1 on 13.01.2025.
//

import UIKit

final class MainViewController: UIViewController {
    var router: MainRoutingLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        
        let textField = UITextField(frame: .init(origin: .zero, size: .init(width: 300, height: 50)))
        textField.text = "Main"
        textField.center = view.center
        view.addSubview(textField)
        
        let button = UIButton(type: .system)
        button.setTitle("show Details screen", for: .normal)
        button.addTarget(self, action: #selector(showDetailsScreen), for: .touchUpInside)
        button.frame = .init(origin: .zero, size: .init(width: 300, height: 50))
        
        let button2 = UIButton(type: .system)
        button2.setTitle("show Profile screen", for: .normal)
        button2.addTarget(self, action: #selector(showProfileScreen), for: .touchUpInside)
        button2.frame = .init(origin: .zero, size: .init(width: 300, height: 50))
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.frame = .init(origin: .zero, size: .init(width: 300, height: 100))
        stack.center = view.center
        stack.addArrangedSubview(button)
        stack.addArrangedSubview(button2)
        view.addSubview(stack)
    }
    
    @objc
    func showDetailsScreen() {
        router?.showDetailsScreen()
    }
    
    @objc
    func showProfileScreen() {
        router?.showProfileScreen()
    }
}
