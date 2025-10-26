import SwiftUI

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
                WardrobeController.AddItemSheet(controller: controller)
            }
            .task {
                controller.loadItems()
            }
        }
    }
}

#Preview {
    WardrobeView()
}
