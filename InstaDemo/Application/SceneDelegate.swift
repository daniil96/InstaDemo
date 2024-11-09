//
//  SceneDelegate.swift
//  InstaDemo
//
//  Created by A1 on 01.11.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = makeRootViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
    
    private func makeRootViewController() -> UIViewController {
        let decoderService = DecoderService()
        let networkService = NetworkService()
        let apiService = APIService(decoderService: decoderService, networkService: networkService)
        let viewController = ProfileViewController()
        let presenter = ProfilePresenter(apiService: apiService)
        
        viewController.presenter = presenter
        presenter.viewController = viewController
        
        return viewController
    }
}


//    func sceneDidDisconnect(_ scene: UIScene) {
//    }
//
//    func sceneDidBecomeActive(_ scene: UIScene) {
//        // Когда в фон уходит
//    }
//
//    func sceneWillResignActive(_ scene: UIScene) {
//        // Прежде чем уйти в фон
//    }
//
//    func sceneWillEnterForeground(_ scene: UIScene) {
//        // Когда собирается выйти из бекграунда
//    }
//
//    func sceneDidEnterBackground(_ scene: UIScene) {
//        // Когда вышли из бекграунда
//    }
