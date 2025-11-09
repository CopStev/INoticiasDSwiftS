//
//  NetworkManager.swift
//  noticias
//
//  Created by Mac on 02/11/25.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func fetchArticles(from urlString: String) async throws -> [Article] {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(NewsResponse.self, from: data)
        return response.data
    }
}
