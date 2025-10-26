import Foundation
import PhotosUI
import SwiftUI

class WardrobeController: ObservableObject {
    @Published var items: [WardrobeItem] = []
    @Published var selectedCategory = "all"
    @Published var showAddSheet = false

    // Add item form state
    @Published var formName = ""
    @Published var formCategory = "tops"
    @Published var formBrand = ""
    @Published var formSelectedImage: PhotosPickerItem?
    @Published var formImageData: Data?
    @Published var formIsLoading = false
    @Published var formErrorMessage: String?

    let categories = ["all", "tops", "bottoms", "shoes", "outerwear", "accessories"]
    let formCategories = ["tops", "bottoms", "shoes", "outerwear", "accessories"]
    private let baseURL = "https://smartfit-backend-lhz4.onrender.com/api/wardrobe"

    var filteredItems: [WardrobeItem] {
        if selectedCategory == "all" {
            return items
        }
        return items.filter { $0.category == selectedCategory }
    }

    func loadItems() {
        Task {
            guard let url = URL(string: baseURL) else { return }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(WardrobeResponse.self, from: data)
                DispatchQueue.main.async {
                    self.items = response.data
                }
            } catch {
                print("Error loading items: \(error)")
            }
        }
    }

    func submitAddItem() {
        formIsLoading = true
        Task {
            do {
                guard let url = URL(string: baseURL) else {
                    throw NSError(domain: "Invalid URL", code: -1)
                }

                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")

                var body: [String: Any] = [
                    "userId": "test-user",
                    "name": formName,
                    "category": formCategory,
                    "brand": formBrand
                ]

                if let imageData = formImageData {
                    let base64 = "data:image/jpeg;base64," + imageData.base64EncodedString()
                    body["image_data"] = base64
                }

                request.httpBody = try? JSONSerialization.data(withJSONObject: body)

                let (_, _) = try await URLSession.shared.data(for: request)
                await MainActor.run {
                    self.loadItems()
                    self.resetForm()
                    self.showAddSheet = false
                }
            } catch {
                await MainActor.run {
                    self.formErrorMessage = "Failed to add item: \(error.localizedDescription)"
                    self.formIsLoading = false
                }
                print("Error adding item: \(error)")
            }
        }
    }

    func resetForm() {
        formName = ""
        formCategory = "tops"
        formBrand = ""
        formSelectedImage = nil
        formImageData = nil
        formIsLoading = false
        formErrorMessage = nil
    }
}
