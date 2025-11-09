//
//  ViewMiembroDaily.swift
//  noticias
//
//  Created by Mac on 06/11/25.
//

import SwiftUI

@MainActor
class ViewMiembroDaily: ObservableObject {
    @Published var miembros: [MiembroDaily] = []
    @Published var isLoading = false
    @Published var errorMessage: String? = nil
    
    func fetchMiembros(count: Int = 10) async {
        isLoading = true
        errorMessage = nil
        let urlString = "https://randomuser.me/api/?results=\(count)"
        
        guard let url = URL(string: urlString) else {
            errorMessage = "URL inválida"
            isLoading = false
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode(MiembroDailyResponse.self, from: data)
            self.miembros = decoded.results
        } catch {
            errorMessage = "Error al cargar miembros: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
