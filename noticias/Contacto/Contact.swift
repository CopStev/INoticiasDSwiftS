//
//  Contact.swift
//  noticias
//
//  Created by Mac on 07/11/25.
//

import Foundation

struct Contact: Decodable, Identifiable {
    let id = UUID()
    let name: String
    let email: String
    let phone: String
    let address: String
    
    enum CodingKeys: String, CodingKey {
        case name, email, phone, address
    }
}
