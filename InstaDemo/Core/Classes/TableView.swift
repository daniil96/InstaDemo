//
//  TableView.swift
//  InstaDemo
//
//  Created by A1 on 30.11.2024.
//

import UIKit

class TableView: UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super .init(frame: frame, style: style)
        backgroundColor = .clear
        showsVerticalScrollIndicator = false
        separatorStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
