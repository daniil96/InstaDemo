//
//  NetworkService.swift
//  InstaDemo
//
//  Created by A1 on 09.11.2024.
//

import Foundation

protocol NetworkServiceable {
    func request(urlRequest: URLRequest, complition: @escaping (Result<Data, Error>) -> Void)
    func request(endpoint: Endpoint, complition: @escaping (Result<Data, Error>) -> Void)
}

final class NetworkService {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    private func makeURLRequest(from endpoint: Endpoint) throws -> URLRequest {
        let url = try makeURL(from: endpoint)
        var urlRequest = URLRequest(url: url)
        
        urlRequest.httpMethod = endpoint.method.rawValue
        
        return urlRequest
    }
    
    private func makeURL(from endpoint: Endpoint) throws -> URL {
        var components = URLComponents()
        components.scheme = endpoint.scheme.rawValue
        components.host = endpoint.host
        components.path = endpoint.path
        
        guard let url = components.url else {
            throw NetworkServiceError.makeURL
        }
        
        return url
    }
}

extension NetworkService: NetworkServiceable {
    func request(urlRequest: URLRequest, complition: @escaping (Result<Data, Error>) -> Void) {
        session.dataTask(with: urlRequest) { data, response, error in
            if let error {
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
                complition(.success(data))
            default:
                complition(.failure(URLError(.badServerResponse)))
                return
            }
        }
        .resume()
    }
    
    func request(endpoint: Endpoint, complition: @escaping (Result<Data, Error>) -> Void) {
        guard let urlRequest = try? makeURLRequest(from: endpoint) else {
            complition(.failure(NetworkServiceError.makeURLRequest))
            return
        }
        
        session.dataTask(with: urlRequest) { data, response, error in
            if let error {
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
                complition(.success(data))
            default:
                complition(.failure(URLError(.badServerResponse)))
                return
            }
        }
        .resume()
    }
}
