//
//  CameraView.swift
//  SmartFit
//
//  Created by Edwin Yu on 2025-10-14.
//

import SwiftUI

struct CameraView: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    
    func makeUIViewController(context: Context) -> CameraViewController {
        let controller = CameraViewController()
        controller.onDismiss = {
            isPresented = false
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {}
}

