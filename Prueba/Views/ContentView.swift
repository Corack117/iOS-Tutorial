//
//  ContentView.swift
//  Prueba
//
//  Created by Sergio Ordaz Romero on 30/07/22.
//

import SwiftUI

// Conforma el protocolo View y describe el contenido de la vista y del layout (diseño)
struct ContentView: View {
    @State private var selection: Tab = .featured
    
    enum Tab {
        case featured
        case list
    }
    
    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

// Declara una preview de la vista anterior
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
            .previewInterfaceOrientation(.portrait)
    }
}
