//
//  NewsService.swift
//  noticias
//
//  Created by Mac on 03/11/25.
//

import Foundation

class NewsService {
    static let shared = NewsService()
    private init() {}

    private let apiKey = "c1ed157b55b90c1e5f57d72c6e07239a"
    private let baseURL = "https://api.mediastack.com/v1/news"

    func fetchNews(language: String = "es", country: String = "mx", limit: Int = 10) async throws -> [Article] {
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "access_key", value: apiKey),
            URLQueryItem(name: "languages", value: language),
            URLQueryItem(name: "countries", value: country),
            URLQueryItem(name: "limit", value: "\(limit)"),
            URLQueryItem(name: "sort", value: "published_desc")
        ]

        guard let url = components.url else { throw URLError(.badURL) }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(NewsResponse.self, from: data)
        return response.data
    }
}
