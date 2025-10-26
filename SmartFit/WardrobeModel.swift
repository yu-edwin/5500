import Foundation
import SwiftUI

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
