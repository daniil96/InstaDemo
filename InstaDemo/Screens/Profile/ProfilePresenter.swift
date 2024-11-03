//
//  ProfilePresenter.swift
//  InstaDemo
//
//  Created by A1 on 03.11.2024.
//

import Foundation

protocol ProfilePresentationLogic {
    func viewDidLoad()
    func dadTapButton()
}

final class ProfilePresenter {
    weak var viewController: ProfileDisplayLogic?
    
    private let service: Servisable
    
    init(service: Servisable) {
        self.service = service
    }
}

extension ProfilePresenter: ProfilePresentationLogic {
    func viewDidLoad() {
        print("viewDidLoad")
        service.method()
        viewController?.updateUI()
    }
    
    func dadTapButton() {
        print(#function)
        viewController?.showError()
    }
}

protocol Servisable {
    func method()
}

final class Service {
    
}

extension Service: Servisable {
    func method() {
        print(#function)
    }
}
