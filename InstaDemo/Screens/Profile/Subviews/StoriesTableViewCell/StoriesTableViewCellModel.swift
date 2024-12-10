//
//  StoriesTableViewCellModel.swift
//  InstaDemo
//
//  Created by A1 on 22.11.2024.
//

import Foundation
import UIKit

struct AddNewStoryCollectionViewCellModel {
    let title: String
}

struct StoryCollectionViewCellModel {
    let title: String
}

struct StoriesSection {
    let type: StoriesSectionType
    let items: [StoriesItemType]
}

enum StoriesSectionType {
    case addNew
    case stories
}

enum StoriesItemType {
    case addNewStory(AddNewStoryCollectionViewCellModel)
    case story(StoryCollectionViewCellModel)
}

struct StoriesTableViewCellModel {
    let sections: [StoriesSection]
    let delegate: StoriesColletionViewCellDelegate
}
