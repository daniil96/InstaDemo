//
//  APIService.swift
//  InstaDemo
//
//  Created by A1 on 09.11.2024.
//

import Foundation

protocol APIServicable {
    func fetchPosts(complition: @escaping (Result<PostsResponse, Error>) -> Void)
}

final class APIService {
    private let decoderService: DecoderServicable
    private let networkService: NetworkServiceable
    
    init(decoderService: DecoderServicable,
         networkService: NetworkServiceable
    ) {
        self.decoderService = decoderService
        self.networkService = networkService
    }
}

extension APIService: APIServicable {
    func fetchPosts(complition: @escaping (Result<PostsResponse, Error>) -> Void) {
//        let urlString = "https://dummyjson.com/posts"
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        
//        let urlRequst = URLRequest(url: url)
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
}
