//
//  ContactService.swift
//  noticias
//
//  Created by Mac on 07/11/25.
//
import Foundation

class ContactService {
    
    static let shared = ContactService()
    
    private init() {}
    
    private let names = ["Clark Kent", "Lois Lane", "Bruce Wayne", "Diana Prince", "Barry Allen"]
    private let emails = ["clark@dailyplanet.com", "lois@dailyplanet.com", "bruce@wayneenterprises.com", "diana@themiscira.com", "barry@ccpd.com"]
    private let phones = ["5512345678", "5512345679", "5512345680", "5512345681", "5512345682"]
    private let addresses = ["Metropolis, Illinois, USA", "Gotham, New Jersey, USA", "Themyscira, Mediterranean Sea", "Central City, Missouri, USA"]
    
    func fetchRandomContact(completion: @escaping (Contact) -> Void) {
        let contact = Contact(
            name: names.randomElement() ?? "John Doe",
            email: emails.randomElement() ?? "john@example.com",
            phone: phones.randomElement() ?? "5551234567",
            address: addresses.randomElement() ?? "Metropolis, USA"
        )
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            completion(contact)
        }
    }
}
