//
//  BaseCoordinator.swift
//  CoordinatorDemo
//
//  Created by A1 on 15.01.2025.
//

import Foundation

class BaseCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    func start() {
        fatalError("Method not implemented")
    }
    
    func addChild(_ coordinator: Coordinator) {
        guard childCoordinators.contains(where: { $0 === coordinator }) else {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    func removeChild(_ coordinator: Coordinator) {
        guard !childCoordinators.isEmpty else {
            return
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
