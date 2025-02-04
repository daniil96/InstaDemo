//
//  CodeViewController.swift
//  CoordinatorDemo
//
//  Created by A1 on 13.01.2025.
//

import UIKit

protocol CodeDisplayLogic: AnyObject {
    func showLoading()
    func hideLoading()
}

final class CodeViewController: UIViewController {
    var presenter: CodePresentationLogic?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        let textField = UITextField(frame: .init(origin: .zero, size: .init(width: 300, height: 50)))
        textField.text = "Code"
        textField.center = view.center
        view.addSubview(textField)
        
        let button = UIButton(type: .system)
        button.setTitle("show Main screen", for: .normal)
        button.addTarget(self, action: #selector(pushMainVC), for: .touchUpInside)
        button.frame = .init(origin: .zero, size: .init(width: 300, height: 50))
        button.center = view.center
        view.addSubview(button)
    }
    
    @objc
    func pushMainVC() {
        presenter?.didTapSend(code: "0000")
    }
}

extension CodeViewController: CodeDisplayLogic {
    func showLoading() {
        print(#function)
    }
    
    func hideLoading() {
        print(#function)
    }
}
