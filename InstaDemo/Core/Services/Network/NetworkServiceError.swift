//
//  NetworkServiceError.swift
//  InstaDemo
//
//  Created by A1 on 09.11.2024.
//

import Foundation

enum NetworkServiceError: Error, LocalizedError {
    case makeURL
    case makeURLRequest
    
    var errorDescription: String {
        switch self {
        case .makeURL:
            return "Ошибка создания URL"
        case .makeURLRequest:
            return "Ошибка создания URLReques"
        }
    }
}
