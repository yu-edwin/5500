import SwiftUI
import PhotosUI

struct WardrobeView: View {
    @StateObject private var controller = WardrobeController()

    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(controller.categories, id: \.self) { category in
                            Button(category.capitalized) {
                                controller.selectedCategory = category
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(controller.selectedCategory == category ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(controller.selectedCategory == category ? .white : .black)
                            .cornerRadius(20)
                        }
                    }
                    .padding()
                }

                if controller.filteredItems.isEmpty {
                    VStack {
                        Image(systemName: "hanger")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("No items yet")
                            .font(.headline)
                            .padding()
                        Button("Add Item") {
                            controller.showAddSheet = true
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .frame(maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(controller.filteredItems) { item in
                                ItemCard(item: item)
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Wardrobe")
            .toolbar {
                Button {
                    controller.showAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $controller.showAddSheet) {
                AddItemSheet(controller: controller)
            }
            .task {
                controller.loadItems()
            }
        }
    }
}

struct ItemCard: View {
    let item: WardrobeItem

    var body: some View {
        VStack(alignment: .leading) {
            if let imageData = item.image_data,
               let base64 = imageData.components(separatedBy: ",").last,
               let data = Data(base64Encoded: base64),
               let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
                    .cornerRadius(8)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 150)
                    .cornerRadius(8)
                    .overlay(
                        Image(systemName: "tshirt")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                    )
            }

            Text(item.name)
                .font(.headline)
                .lineLimit(1)

            if let brand = item.brand {
                Text(brand)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
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

#Preview {
    WardrobeView()
}
