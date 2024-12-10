//
//  ExtensionUIStackView.swift
//  InstaDemo
//
//  Created by A1 on 19.11.2024.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
}
