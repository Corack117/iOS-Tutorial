//
//  ContentView.swift
//  Prueba
//
//  Created by Sergio Ordaz Romero on 30/07/22.
//

import SwiftUI

// Conforma el protocolo View y describe el contenido de la vista y del layout (diseño)
struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

// Declara una preview de la vista anterior
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(ModelData())
                .previewInterfaceOrientation(.portrait)
        }
    }
}
