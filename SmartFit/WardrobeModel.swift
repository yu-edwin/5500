import Foundation

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


class WardrobeModel: ObservableObject {
    @Published var items: [WardrobeItem] = []

    private let baseURL = "https://smartfit-backend-lhz4.onrender.com/api/wardrobe"

    func fetchItems() async throws {
        guard let url = URL(string: baseURL) else {
            throw NSError(domain: "Invalid URL", code: -1)
        }

        let (data, _) = try await URLSession.shared.data(from: url)

        if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
           let dataArray = json["data"] as? [[String: Any]] {
            let itemsData = try JSONSerialization.data(withJSONObject: dataArray)
            let decoder = JSONDecoder()
            items = try decoder.decode([WardrobeItem].self, from: itemsData)
        }
    }

    func addItem(name: String, category: String, brand: String, imageData: Data?) async throws {
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

        let (_, _) = try await URLSession.shared.data(for: request)

        try await fetchItems()
    }
}
