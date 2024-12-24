//
//  AppCoordinator.swift
//  InstaDemo
//
//  Created by A1 on 24.12.2024.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinator: [Coordinator] { get }
    
    func start()
}

final class AppCoordinator: Coordinator {
    private let navigationController = UINavigationController()
    var childCoordinator: [Coordinator] = []
    
    init(window: UIWindow) {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        startProfileFlow()
    }
    
    private func startAuthFlow() {
        let coordinator = AuthCoordinator(navigationController: navigationController)
        coordinator.start()
        childCoordinator.append(coordinator)
        coordinator.onFinishFlow = { [weak self] in
            self?.startProfileFlow()
        }
    }
    
    private func startMainFlow() {
        let coordinator = MainCoordinator()
        coordinator.start()
        coordinator.onFinishFlow = {
            
        }
    }
    
    private func startProfileFlow() {
        let coordinator = ProfileCoordinator(navigationController: navigationController)
        coordinator.start()
        childCoordinator.append(coordinator)
        coordinator.onFinishFlow = { [weak self] in
            self?.startAuthFlow()
        }
    }
}

final class ProfileCoordinator: Coordinator {
    private let navigationController: UINavigationController
    var onFinishFlow: (() -> Void)?
    var childCoordinator: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let profileViewController = makeProfileViewController()
        navigationController.pushViewController(profileViewController, animated: false)
    }
    
    func makeProfileViewController() -> UIViewController {
        let decoderService = DecoderService()
        let networkService = NetworkService()
        let apiService = APIService(decoderService: decoderService, networkService: networkService)
        let viewController = ProfileViewController()
        let presenter = ProfilePresenter(apiService: apiService)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        presenter.router = self
        
        return viewController
    }
}

extension ProfileCoordinator: ProfileRoutingLogic {
    func push() {
        
    }
    
    func pop() {
        onFinishFlow?()
    }
    
    
}

protocol AuthRoutingLogic: AnyObject {
    func push()
}

final class AuthViewController: UIViewController {
    weak var router: AuthRoutingLogic?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let button = UIButton(type: .system)
        button.setTitle("Push", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.frame = CGRect(origin: view.center, size: .init(width: 100, height: 100))
        
        view.addSubview(button)
    }
    
    @objc
    func didTapButton() {
        router?.push()
    }
}

final class AuthCoordinator: Coordinator {
    private let navigationController: UINavigationController
    var onFinishFlow: (() -> Void)?
    var childCoordinator: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = AuthViewController()
        vc.router = self
        navigationController.pushViewController(vc, animated: false)
    }
}

extension AuthCoordinator: AuthRoutingLogic {
    func push() {
        onFinishFlow?()
    }
}

final class MainCoordinator: Coordinator {
    var onFinishFlow: (() -> Void)?
    var childCoordinator: [Coordinator] = []
    
    func start() {
        
    }
}
