//
//  StoryModel.swift
//  InstaDemo
//
//  Created by A1 on 24.12.2024.
//

import Foundation

struct StoryModel {
    let id: Int
    let urlString: String
    let title: String
}

extension StoryModel {
    init?(response: PostResponse) {
        if let title = response.tags.first {
            id = response.id
            urlString = "https://dummyjson.com/icon/\(title)/150"
            self.title = title
        } else {
            return nil
        }
    }
}
