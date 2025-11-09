//
//  ContactView.swift
//  noticias
//
//  Created by Mac on 07/11/25.
//

import SwiftUI

struct ContactView: View {
    
    @State private var contact: Contact? = nil
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Text("¡Gracias por visitarnos!")
                .font(.largeTitle.bold())
                .foregroundStyle(.blue)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
            Image(systemName: "star.fill")
                .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.yellow)
            Text("Si tienes alguna noticia, contáctanos:")
                .font(.headline)
                .foregroundStyle(.primary)
            
            if let c = contact {
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image(systemName: "phone.fill")
                            .foregroundStyle(.green)
                        Text("Teléfono: ").fontWeight(.semibold)
                        Text(c.phone)
                    }
                    
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundStyle(.orange)
                        Text("Correo: ").fontWeight(.semibold)
                        Text(c.email)
                    }
                    
                    HStack(alignment: .top) {
                        Image(systemName: "map.fill")
                            .foregroundStyle(.red)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Ubicación:").fontWeight(.semibold)
                            Text(c.address)
                        }
                    }
                }
                .font(.body)
                .foregroundStyle(.primary)
            } else {
                ProgressView("Cargando contacto...")
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemBackground))
        .navigationTitle("Contacto")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            ContactService.shared.fetchRandomContact { contact in
                self.contact = contact
            }
        }
    }
}

#Preview {
    NavigationStack {
        ContactView()
    }
}
