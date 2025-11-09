//
//  NewsViewModel.swift
//  noticias
//
//  Created by Mac on 03/11/25.
//

import Foundation

@MainActor
class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil

    func fetchNews() async {
        isLoading = true
        errorMessage = nil

        do {
            let news = try await NewsService.shared.fetchNews()
            self.articles = news
        } catch {
            errorMessage = "Las noticias no pudieron encontrarse, error API \(error.localizedDescription)"
            articles = []
        }

        isLoading = false
    }
}

