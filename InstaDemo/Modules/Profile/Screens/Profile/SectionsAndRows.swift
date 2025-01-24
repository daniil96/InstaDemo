//
//  SectionsAndRows.swift
//  InstaDemo
//
//  Created by A1 on 30.11.2024.
//

import Foundation

struct ProfileSection {
    let type: ProfileSectionType
    let rows: [ProfileRowsType]
}

enum ProfileSectionType {
    case info
    case stories
    case tabs
    case posts
}

enum ProfileRowsType {
    case navbar(NavbarTableViewCellModel)
    case accountInfo(AccountInfoTableViewCellModel)
    case bio(BioTableViewCellModel)
    case editProfile(EditProfileTableViewCellModel)
    case stories(StoriesTableViewCellModel)
    case tabs(TabsTableViewCellModel)
    case posts(PostsTableViewCellModel)
}
