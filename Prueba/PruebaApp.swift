//
//  PruebaApp.swift
//  Prueba
//
//  Created by Sergio Ordaz Romero on 30/07/22.
//

import SwiftUI

@main
struct PruebaApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        #if os(watchOS)
                WKNotificationScene(controller: NotificationController.self, category: "LandmarkNear")
        #endif
    }
}
