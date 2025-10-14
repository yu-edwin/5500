//
//  ContentView.swift
//  SmartFit
//
//  Created by Edwin Yu on 2025-10-09.
//

import SwiftUI

struct ContentView: View {
    @State private var showCamera = false
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Wardrobe Placeholder")
                .tabItem {
                    Label("Wardrobe", systemImage: "hanger")
                }
                .tag(0)
            Text("Camera")
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }
                .tag(1)
            Text("Settings Placeholder")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .tag(2)
        }
        .onChange(of: selectedTab) { _, newValue in
            if newValue == 1 {
                showCamera = true
                selectedTab = 0
            }
        }
        .fullScreenCover(isPresented: $showCamera) {
            CameraView(isPresented: $showCamera)
                .ignoresSafeArea()
        }
    }
}

//
//struct ContentView : View {
//    var body: some View {
//        RealityView { content in
//
//            // Create a cube model
//            let model = Entity()
//            let mesh = MeshResource.generateBox(size: 0.1, cornerRadius: 0.005)
//            let material = SimpleMaterial(color: .gray, roughness: 0.15, isMetallic: true)
//            model.components.set(ModelComponent(mesh: mesh, materials: [material]))
//            model.position = [0, 0.05, 0]
//
//            // Create horizontal plane anchor for the content
//            let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.2, 0.2)))
//            anchor.addChild(model)
//
//            // Add the horizontal plane anchor to the scene
//            content.add(anchor)
//
//            content.camera = .spatialTracking
//
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//
//}
//
//#Preview {
//    ContentView()
//}
