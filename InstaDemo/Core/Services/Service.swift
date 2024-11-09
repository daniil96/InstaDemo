//
//  Service.swift
//  InstaDemo
//
//  Created by A1 on 07.11.2024.
//

import Foundation

protocol Servicable  {
    func method()
    func fetchPosts(complition: @escaping (Result<PostsResponse, Error>) -> Void)
}

final class Service {
    
}

extension Service: Servicable  {
    func method() {
        print(#function)
    }
    
    func fetchPosts(complition: @escaping (Result<PostsResponse, Error>) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/posts") else {
            complition(.failure(URLError(.badURL)))
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error {
                print(error.localizedDescription)
                complition(.failure(error))
                return
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                complition(.failure(URLError(.badServerResponse)))
                return
            }
            let statusCode = urlResponse.statusCode
            
            switch statusCode {
            case 200...299:
                guard let data else {
                    complition(.failure(URLError(.badServerResponse)))
                    return
                }
                
                do {
                    let response = try JSONDecoder().decode(PostsResponse.self, from: data)
                    complition(.success(response))
                } catch {
                    complition(.failure(error))
                    return
                }
                
            default:
                complition(.failure(URLError(.badServerResponse)))
                return
            }
        }
        .resume()
    }
}
