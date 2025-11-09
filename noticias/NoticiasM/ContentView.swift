//
//  ContentView.swift
//  noticias
//
//  Created by Mac on 02/11/25.
//
import SwiftUI
var dailyplanet: some View {
    Text(Strings.bienvenida)
        .font(.title2)
        .fontWeight(.bold)
        .multilineTextAlignment(.center)
        .padding(.top, 16)
}
let imageNames = ["af", "ai", "ag", "ah", "ak", "al", "ba", "ca", "mm", "sw"]
struct ContentView: View {
    @StateObject private var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Cargando las noticias para TI...")
                        .padding()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                } else {
                   dailyplanet
                    Image(systemName: "globe")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 70)
                        .padding(.horizontal)
                    
                    List(Array(viewModel.articles.prefix(10).enumerated()), id: \.element.id) { index, article in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(article.title)
                                .font(.headline)
                                .fontWeight(.bold)
                            Image(imageNames[index % imageNames.count])
                                     .resizable()
                                     .scaledToFill()
                                     .frame(height: 200)
                                     .clipped()
                                     .cornerRadius(8)
                            if let description = article.description {
                                Text(description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    .listStyle(.plain)
                    .navigationTitle("")
                    
                }
            }
            .task {
                await viewModel.fetchNews()
            }
        }
    }
}

#Preview {
    ContentView()
}
