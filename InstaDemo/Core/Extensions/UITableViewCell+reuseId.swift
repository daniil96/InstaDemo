//
//  UITableViewCell+reuseId.swift
//  InstaDemo
//
//  Created by A1 on 18.11.2024.
//

import UIKit

extension UITableViewCell {
    static var reuseID: String {
        String(describing: Self.self)
    }
}

extension UITableView {
    func register(type: UITableViewCell.Type) {
        register(type, forCellReuseIdentifier: type.reuseID)
    }
    
    func register(types: [UITableViewCell.Type]) {
        types.forEach { register(type: $0) }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseID, for: indexPath) as? T else {
            fatalError("Not found cell with reuseID: \(type.reuseID)")
        }
        return cell
    }
}
