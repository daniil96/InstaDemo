//
//  APIService.swift
//  InstaDemo
//
//  Created by A1 on 09.11.2024.
//

import Foundation

protocol APIServicable {
    func fetchPosts(complition: @escaping (Result<PostsResponse, Error>) -> Void)
    func fetchPosts() async throws -> PostsResponse
}

final class APIService {
    private let decoderService: DecoderServicable
    private let networkService: NetworkServicable
    
    init(decoderService: DecoderServicable,
         networkService: NetworkServicable
    ) {
        self.decoderService = decoderService
        self.networkService = networkService
    }
}

extension APIService: APIServicable {
    func fetchPosts(complition: @escaping (Result<PostsResponse, Error>) -> Void) {
        networkService.request(endpoint: PostEndpoint.allPosts) { [weak self] result in
            guard let self else {
                return
            }
            
            switch result {
            case let .success(data):
                do {
                    let result: PostsResponse = try self.decoderService.decode(data: data)
                    complition(.success(result))
                } catch {
                    complition(.failure(error))
                }
            case let .failure(error):
                complition(.failure(error))
            }
        }
    }

    func fetchPosts() async throws -> PostsResponse {
        let endpoint = PostEndpoint.allPosts
        let data = try await networkService.request(endpoint: endpoint)
        let result: PostsResponse = try decoderService.decode(data: data)
        
        return result
    }
}
