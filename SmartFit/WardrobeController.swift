import Foundation
import PhotosUI
import SwiftUI

class WardrobeController: ObservableObject {
    @Published var model = WardrobeModel()
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

    var filteredItems: [WardrobeItem] {
        if selectedCategory == "all" {
            return model.items
        }
        return model.items.filter { $0.category == selectedCategory }
    }

    func loadItems() {
        Task {
            do {
                try await model.fetchItems()
            } catch {
                print("Error loading items: \(error)")
            }
        }
    }

    func submitAddItem() {
        formIsLoading = true
        Task {
            do {
                try await model.addItem(name: formName, category: formCategory, brand: formBrand, imageData: formImageData)
                await MainActor.run {
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
