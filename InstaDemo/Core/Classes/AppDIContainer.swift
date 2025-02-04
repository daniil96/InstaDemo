//
//  APPDIContainer.swift
//  InstaDemo
//
//  Created by A1 on 04.02.2025.
//

import Foundation

final class AppDIContainer {
    let defaultsService: UserDefaultsService
    let decoderService: DecoderServicable
    let networkService: NetworkServicable
    
    init(
        defaultsService: UserDefaultsService = UserDefaultsService(),
        decoderService: DecoderServicable = DecoderService(),
        networkService: NetworkServicable = NetworkService()
    ) {
        self.defaultsService = defaultsService
        self.decoderService = decoderService
        self.networkService = networkService
    }
}
