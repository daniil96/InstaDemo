//
//  AuthAPIService.swift
//  CoordinatorDemo
//
//  Created by A1 on 15.01.2025.
//

import Foundation

protocol AuthAPIServiciable {
    func request() async throws
}

final class AuthAPIService: AuthAPIServiciable {
    func request() async throws {
        try? await Task.sleep(for: .seconds(0.5))
    }
}
