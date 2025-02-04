//
//  AsyncImageView.swift
//  InstaDemo
//
//  Created by A1 on 24.12.2024.
//

import UIKit

final class AsyncImageView: UIImageView {
    private let networkSrvice: NetworkServicable = NetworkService()
    
    private var url: URL?
    
    func set(url: URL?) {
        backgroundColor = .blue
        
        guard let url else {
            backgroundColor = .red
            return
        }
        
        Task(priority: .utility) {
            do {
                let urlRequest = URLRequest(url: url)
                let data = try await networkSrvice.request(urlRequest: urlRequest)
                await MainActor.run {
                    image = UIImage(data: data)
                    backgroundColor = .clear
                }
            } catch {
                await MainActor.run {
                    backgroundColor = .red
                }
            }
        }
    }
}
