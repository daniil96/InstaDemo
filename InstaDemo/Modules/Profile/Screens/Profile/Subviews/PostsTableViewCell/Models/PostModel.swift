//
//  PostModel.swift
//  InstaDemo
//
//  Created by A1 on 24.12.2024.
//

import Foundation

struct PostModel {
    let id: Int
    let urlString: String
}

extension PostModel {
    init(response: PostResponse) {
        id = response.id
        urlString = "https://dummyjson.com/image/200x200/008080/ffffff?text=\(response.title)&fontSize=16"
    }
}
