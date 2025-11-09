//
//  MiembroDaily.swift
//  noticias
//
//  Created by Mac on 06/11/25.
//

import Foundation

struct MiembroDailyResponse: Codable {
    let results: [MiembroDaily]
}

struct MiembroDaily: Codable, Identifiable {
    let id = UUID()
    let name: Name
    let email: String
    let picture: Picture
    
    struct Name: Codable {
        let title: String
        let first: String
        let last: String
        
        var fullName: String {
            "\(title) \(first) \(last)"
        }
    }
    
    struct Picture: Codable {
        let large: String
        let medium: String
        let thumbnail: String
    }
}
