//
//  PostEndpoint.swift
//  InstaDemo
//
//  Created by A1 on 09.11.2024.
//

import Foundation

enum PostEndpoint {
    case allPosts
    case allusers
}

extension PostEndpoint: Endpoint {
    var scheme: HTTPScheme {
        switch self {
        case .allPosts:
            return .https
        case .allusers:
            return .https
        }
    }
    
    var host: String {
        switch self {
        case .allPosts:
            return "dummyjson.com"
        case .allusers:
            return "dummyjson.com"
        }
    }
    
    var path: String {
        switch self {
        case .allPosts:
            return "/posts"
        case .allusers:
            return "/users"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .allPosts:
            return .get
        case .allusers:
            return .post
        }
    }
}
