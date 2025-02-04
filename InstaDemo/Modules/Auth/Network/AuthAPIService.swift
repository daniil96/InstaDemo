//
//  AuthAPIService.swift
//  InstaDemo
//
//  Created by A1 on 04.02.2025.
//

import Foundation

protocol AuthAPIServicable {
    func send(phone: String) async throws
}

protocol CodeAPIServicable {
    func send(phone: String, code: String) async throws
}

final class AuthAPIService {
    private let decoderService: DecoderServicable
    private let networkService: NetworkServicable
    
    init(decoderService: DecoderServicable, networkService: NetworkServicable) {
        self.decoderService = decoderService
        self.networkService = networkService
    }
}

extension AuthAPIService: AuthAPIServicable {
    func send(phone: String) async throws {
        print(#function)
        try? await Task.sleep(for: .seconds(0.5))
    }
}

extension AuthAPIService: CodeAPIServicable {
    func send(phone: String, code: String) async throws {
        print(#function)
        try? await Task.sleep(for: .seconds(0.5))
    }
}
