//
//  DetailsViewController.swift
//  CoordinatorDemo
//
//  Created by A1 on 13.01.2025.
//

import UIKit

final class DetailsViewController: UIViewController {
    var router: MainRoutingLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        
        let textField = UITextField(frame: .init(origin: .zero, size: .init(width: 300, height: 50)))
        textField.text = "Details"
        textField.center = view.center
        view.addSubview(textField)
    }
}
