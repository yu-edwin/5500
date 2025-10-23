import SwiftUI
import PhotosUI

struct WardrobeView: View {
    @State private var items: [WardrobeItem] = []
    @State private var selectedCategory = "all"
    @State private var showAddSheet = false
    
    let categories = ["all", "tops", "bottoms", "shoes", "outerwear", "accessories"]
    
    var filteredItems: [WardrobeItem] {
        if selectedCategory == "all" {
            return items
        }
        return items.filter { $0.category == selectedCategory }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(categories, id: \.self) { category in
                            Button(category.capitalized) {
                                selectedCategory = category
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(selectedCategory == category ? Color.blue : Color.gray.opacity(0.2))
                            .foregroundColor(selectedCategory == category ? .white : .black)
                            .cornerRadius(20)
                        }
                    }
                    .padding()
                }
                
                if filteredItems.isEmpty {
                    VStack {
                        Image(systemName: "hanger")
                            .font(.system(size: 60))
                            .foregroundColor(.gray)
                        Text("No items yet")
                            .font(.headline)
                            .padding()
                        Button("Add Item") {
                            showAddSheet = true
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
                            ForEach(filteredItems) { item in
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
                    showAddSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showAddSheet) {
                AddItemSheet(onAdd: loadItems)
            }
            .task {
                loadItems()
            }
        }
    }
    
    func loadItems() {
        Task {
            guard let url = URL(string: "https://smartfit-backend-lhz4.onrender.com/api/wardrobe") else { return }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(WardrobeResponse.self, from: data)
                items = response.data
            } catch {
                print("Error: \(error)")
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
    let onAdd: () -> Void
    
    @State private var name = ""
    @State private var category = "tops"
    @State private var brand = ""
    @State private var selectedImage: PhotosPickerItem?
    @State private var imageData: Data?
    
    let categories = ["tops", "bottoms", "shoes", "outerwear", "accessories"]
    
    var body: some View {
        NavigationView {
            Form {
                Section("Photo") {
                    if let imageData = imageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 200)
                    }
                    PhotosPicker(selection: $selectedImage, matching: .images) {
                        Label("Select Photo", systemImage: "photo")
                    }
                }
                
                Section("Details") {
                    TextField("Name", text: $name)
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { cat in
                            Text(cat.capitalized)
                        }
                    }
                    TextField("Brand (optional)", text: $brand)
                }
            }
            .navigationTitle("Add Item")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        addItem()
                    }
                    .disabled(name.isEmpty)
                }
            }
            .onChange(of: selectedImage) { _, newValue in
                Task {
                    if let data = try? await newValue?.loadTransferable(type: Data.self) {
                        imageData = data
                    }
                }
            }
        }
    }
    
    func addItem() {
        Task {
            guard let url = URL(string: "https://smartfit-backend-lhz4.onrender.com/api/wardrobe") else { return }
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
                onAdd()
                dismiss()
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

struct WardrobeItem: Identifiable, Codable {
    let id: String
    let userId: String
    let category: String
    let name: String
    let brand: String?
    let image_data: String?
    let price: Double?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userId, category, name, brand, image_data, price
    }
}

struct WardrobeResponse: Codable {
    let data: [WardrobeItem]
}

#Preview {
    WardrobeView()
}
