//
//  AuthCodeRequest.swift
//  InstaDemo
//
//  Created by A1 on 04.02.2025.
//

import Foundation

struct AuthCodeRequest: Encodable {
    let phone: String
    let code: String
}
