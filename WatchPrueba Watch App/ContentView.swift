//
//  ContentView.swift
//  WatchPrueba Watch App
//
//  Created by Sergio Ordaz Romero on 11/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
