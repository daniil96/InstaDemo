//
//  StoriesTableViewCellModel.swift
//  InstaDemo
//
//  Created by A1 on 22.11.2024.
//

import Foundation
import UIKit

enum StoriesType {
    case addStories
    case firstStories
    case secondStories
    case thirdStories
    
    var title: String {
        switch self {
        case .addStories:
            return String()
        case .firstStories:
            return String()
        case .secondStories:
            return String()
        case .thirdStories:
            return String()
        }
    }
}

struct StoriesTableViewCellModel {
//    var imageStories: String?
    let nameStories: [(type: String, image: UIImage)]
//    let delegate: StoriesTableViewCellDelegate
}
