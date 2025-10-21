import SwiftUI
import RealityKit
import ARKit

struct ContentView: View {
    var body: some View {
        TabView {
            WardrobeView()
                .tabItem {
                    Label("Wardrobe", systemImage: "hanger")
                }
            
            CameraView()
                .tabItem {
                    Label("Camera", systemImage: "camera")
                }

            Text("Settings Placeholder")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
