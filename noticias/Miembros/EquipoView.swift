//
//  EquipoView.swift
//  noticias
//
//  Created by Mac on 06/11/25.
//

import SwiftUI

struct EquipoView: View {
    @StateObject private var viewModel = ViewMiembroDaily()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Cargando equipo...")
                        .padding()
                } else if let error = viewModel.errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.miembros) { miembro in
                        HStack(spacing: 16) {
                            AsyncImage(url: URL(string: miembro.picture.medium)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                            
                            VStack(alignment: .leading) {
                                Text(miembro.name.fullName)
                                    .font(.headline)
                                Text(miembro.email)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Miembros \(Strings.DP)")
            .task {
                await viewModel.fetchMiembros()
            }
        }
    }
}
#Preview {
    EquipoView()
}
