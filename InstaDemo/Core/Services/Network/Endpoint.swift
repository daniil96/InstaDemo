//
//  Endpoint.swift
//  InstaDemo
//
//  Created by A1 on 09.11.2024.
//

import Foundation

protocol Endpoint {
    var scheme: HTTPScheme { get }
    var host: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
}
