//
//  UICollectionView.swift
//  InstaDemo
//
//  Created by A1 on 01.12.2024.
//

import UIKit

extension UICollectionViewCell {
    static var reuseID: String {
        String(describing: Self.self)
    }
}

extension UICollectionView {
    func register(type: UICollectionViewCell.Type) {
        register(type, forCellWithReuseIdentifier: type.reuseID)
    }
    
    func register(types: [UICollectionViewCell.Type]) {
        types.forEach { register(type: $0) }
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(type: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.reuseID, for: indexPath) as? T else {
            fatalError("Not found cell with reuseID: \(type.reuseID)")
        }
        return cell
    }
}
