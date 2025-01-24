//
//  AccountInfoTableViewCellModel.swift
//  InstaDemo
//
//  Created by A1 on 19.11.2024.
//

import Foundation

enum StatisticType {
    case posts
    case followers
    case following
    
    var title: String {
        switch self {
        case .posts:
            return "Posts"
        case .followers:
            return "Followers"
        case .following:
            return "Following"
        }
    }
}

struct AccountInfoTableViewCellModel {
    let statistics: [( type: StatisticType, value: Int)]
}
