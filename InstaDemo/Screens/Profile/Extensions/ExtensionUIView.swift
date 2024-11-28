//
//  ExtensionUIView.swift
//  InstaDemo
//
//  Created by A1 on 19.11.2024.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }
}
