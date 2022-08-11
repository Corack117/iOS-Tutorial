//
//  CategoryHome.swift
//  Prueba
//
//  Created by Sergio Ordaz Romero on 03/08/22.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProgile = false
    
    var body: some View {
        NavigationView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(EdgeInsets())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.inset)
            .navigationTitle("Featured")
            .toolbar {
                Button {
                    showingProgile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProgile) {
                ProfileHost()
                    .environmentObject(modelData)
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
