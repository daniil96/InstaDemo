//
//  UserDefaultsService.swift
//  InstaDemo
//
//  Created by A1 on 23.01.2025.
//

import Foundation

protocol UserDefaultsServicable {
    func set(value: Bool, for key: UserDefaultsKey) 
    func fetch(for key: UserDefaultsKey) -> Bool
}

final class UserDefaultsService {
    private let defaults = UserDefaults.standard
}

extension UserDefaultsService: UserDefaultsServicable {
    func set(value: Bool, for key: UserDefaultsKey) {
        defaults.set(value, forKey: key.rawValue)
    }
    
    func fetch(for key: UserDefaultsKey) -> Bool {
        defaults.bool(forKey: key.rawValue)
    }
}

enum UserDefaultsKey: String {
    case isUserAuth
    case isFirstLaunch
}
