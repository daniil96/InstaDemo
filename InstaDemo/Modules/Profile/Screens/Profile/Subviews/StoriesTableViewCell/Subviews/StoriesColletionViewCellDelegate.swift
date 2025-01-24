//
//  StoryColletionViewCellDelegate.swift
//  InstaDemo
//
//  Created by A1 on 02.12.2024.
//

import Foundation

protocol StoriesColletionViewCellDelegate: AnyObject {
    func didTapStory(index: Int)
    func didTapAddNewStory(index: Int)
}
