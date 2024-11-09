//
//  PostsResponse.swift
//  InstaDemo
//
//  Created by A1 on 09.11.2024.
//

import Foundation

struct PostsResponse: Decodable {
    let posts: [PostResponse]
    let total: Int
    let skip: Int
    let limit: Int
}
    
struct PostResponse: Decodable {
    let id: Int
    let title: String
    let body: String
    let tags: [String]
    let reactions: ReactionResponse
    let views: Int
    let userId: Int
}

struct ReactionResponse: Decodable {
    let likes: Int
    let dislikes: Int
}
