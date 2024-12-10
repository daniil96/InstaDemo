//
//  PostsTableViewCellModel.swift
//  InstaDemo
//
//  Created by A1 on 28.11.2024.
//

import Foundation
import UIKit

struct PostCollectionViewCellModel {
//    let Image: UIImage
}

struct PostsSection {
    let type: PostsSectionType
    let items: [PostsItemType]
}

enum PostsSectionType {
    case posts
}

enum PostsItemType {
    case post(PostCollectionViewCellModel)
}

struct PostsTableViewCellModel {
    let sections: [PostsSection]
}
