//
//  DecoderService.swift
//  InstaDemo
//
//  Created by A1 on 09.11.2024.
//

import Foundation

protocol DecoderServicable {
    func decode<T: Decodable>(data: Data) throws -> T
}

final class DecoderService {
    private let decoder = JSONDecoder()
}

extension DecoderService: DecoderServicable {
    func decode<T: Decodable>(data: Data) throws -> T {
        try decoder.decode(T.self, from: data)
    }
}
