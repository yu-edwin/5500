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
                try await addItem(name: formName, category: formCategory, brand: formBrand, imageData: formImageData)
                await MainActor.run {
                    self.resetForm()
                    self.showAddSheet = false
                }
            } catch {
                await MainActor.run {
                    self.formErrorMessage = "Failed to add item: \(error.localizedDescription)"
                    self.formIsLoading = false
                }
            }
        }
    }

    private func addItem(name: String, category: String, brand: String, imageData: Data?) async throws {
        guard let url = URL(string: baseURL) else {
            throw NSError(domain: "Invalid URL", code: -1)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        var body: [String: Any] = [
            "userId": "test-user",
            "name": name,
            "category": category,
            "brand": brand
        ]

        if let imageData = imageData {
            let base64 = "data:image/jpeg;base64," + imageData.base64EncodedString()
            body["image_data"] = base64
        }

        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        do {
            let (_, _) = try await URLSession.shared.data(for: request)
            await MainActor.run {
                self.loadItems()
            }
        } catch {
            print("Error adding item: \(error)")
            throw error
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

    struct AddItemSheet: View {
        @Environment(\.dismiss) var dismiss
        @ObservedObject var controller: WardrobeController

        var body: some View {
            NavigationView {
                Form {
                    Section("Photo") {
                        if let imageData = controller.formImageData, let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 200)
                        }
                        PhotosPicker(selection: $controller.formSelectedImage, matching: .images) {
                            Label("Select Photo", systemImage: "photo")
                        }
                    }

                    Section("Details") {
                        TextField("Name", text: $controller.formName)
                        Picker("Category", selection: $controller.formCategory) {
                            ForEach(controller.formCategories, id: \.self) { cat in
                                Text(cat.capitalized)
                            }
                        }
                        TextField("Brand (optional)", text: $controller.formBrand)
                    }

                    if let errorMessage = controller.formErrorMessage {
                        Section {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .font(.caption)
                        }
                    }
                }
                .navigationTitle("Add Item")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            controller.resetForm()
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            controller.submitAddItem()
                        }
                        .disabled(controller.formName.isEmpty || controller.formIsLoading)
                    }
                }
                .onChange(of: controller.formSelectedImage) { _, newValue in
                    Task {
                        if let data = try? await newValue?.loadTransferable(type: Data.self) {
                            controller.formImageData = data
                        }
                    }
                }
            }
        }
    }
}
