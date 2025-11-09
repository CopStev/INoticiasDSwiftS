//
//  Article.swift
//  noticias
//
//  Created by Mac on 02/11/25.
//

import Foundation

struct Article: Identifiable, Codable {
    let id = UUID()
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let source: String?
    let imageName: String?
    let published_at: String?
}

struct NewsResponse: Codable {
    let data: [Article]
    let pagination: Pagination?
}

struct Pagination: Codable {
    let limit: Int?
    let offset: Int?
    let count: Int?
    let total: Int?
}
