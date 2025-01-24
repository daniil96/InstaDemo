//
//  CoordinatorOutput.swift
//  CoordinatorDemo
//
//  Created by A1 on 14.01.2025.
//

import Foundation

protocol CoordinatorOutput {
    var finishFlow: (() -> Void)? { get }
}
