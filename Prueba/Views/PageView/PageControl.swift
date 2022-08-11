//
//  PageControl.swift
//  Prueba
//
//  Created by Sergio Ordaz Romero on 10/08/22.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        // UIControl and UIPageControl not uses delegator, uses target-action pettern(patron disparo-accion)
        // Usan @objc para actualzar el binding
        @objc
        func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
