//
//  TabsTableViewCellDelegate.swift
//  InstaDemo
//
//  Created by A1 on 28.11.2024.
//

import Foundation

protocol TabsTableViewCellDelegate: AnyObject {
    func didTapPostsButton()
    func didTapRealsButton()
    func didTapMentionsButton()
}
