import Foundation
import PhotosUI
import SwiftUI

class WardrobeController: ObservableObject {
    @Published var model = WardrobeModel()
    @Published var selectedCategory = "all"
    @Published var selectedOutfit = 1 {  // 1, 2, or 3
        didSet {
            saveOutfits()
        }
    }
    @Published var showAddSheet = false
    @Published var outfits: [Int: [String: String]] = [1: [:], 2: [:], 3: [:]]  // outfitNumber -> (category -> itemId)

    var currentEquippedOutfit: [String: String] {
        outfits[selectedOutfit] ?? [:]
    }

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
                // Try to load saved outfits first
                if !loadOutfits() {
                    // If no saved data, initialize with empty outfits
                    DispatchQueue.main.async {
                        self.outfits = [1: [:], 2: [:], 3: [:]]
                    }
                }
            } catch {
                print("Error loading items: \(error)")
            }
        }
    }

    func saveOutfits() {
        do {
            let data = try JSONEncoder().encode(outfits)
            UserDefaults.standard.set(data, forKey: "savedOutfits")
        } catch {
            print("Error saving outfits: \(error)")
        }
    }

    func loadOutfits() -> Bool {
        if let data = UserDefaults.standard.data(forKey: "savedOutfits") {
            do {
                let decoded = try JSONDecoder().decode([Int: [String: String]].self, from: data)
                DispatchQueue.main.async {
                    self.outfits = decoded
                }
                return true
            } catch {
                print("Error loading outfits: \(error)")
                return false
            }
        }
        return false
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

    func equipItem(itemId: String, category: String) {
        print("Equipping item \(itemId) in category \(category) to outfit \(selectedOutfit)")
        var updatedOutfits = outfits
        updatedOutfits[selectedOutfit]?[category] = itemId
        outfits = updatedOutfits
        print("Updated outfit \(selectedOutfit): \(currentEquippedOutfit)")
        saveOutfits()
    }
}
