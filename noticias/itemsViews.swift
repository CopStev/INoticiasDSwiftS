//
//  itemsViews.swift
//  noticias
//
//  Created by Mac on 05/11/25.
//

import SwiftUI
struct itemsViews: View {
    var body: some View {
        TabView {
            WelcomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text(Strings.inicio)
                    }
                }
           
            ContentView()
                .tabItem {
                    VStack {
                        Image(systemName: "newspaper")
                        Text(Strings.noticias)
                    }
                }
            
            EquipoView()
            .tabItem {
                VStack {
                    Image(systemName: "person.3")
                    Text(Strings.miembros)
                }
            }
            ContactView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.crop.rectangle")
                        Text(Strings.contacto)
                    }
                }
        }
    }
}

#Preview {
    itemsViews()
}
