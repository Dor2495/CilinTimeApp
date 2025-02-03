import Foundation

struct Appointment: Identifiable, Equatable, Decodable, Encodable {
    var id: String
    var date: Date
    var title: String
    var price: Double
    
    init(date: Date, title: String, price: Double) {
        self.id = UUID().uuidString
        self.date = date
        self.title = title
        self.price = price
    }

    // Custom date decoding
    private enum CodingKeys: String, CodingKey {
        case id, date, title, price
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        
        // Custom date decoding for date
        let dateString = try container.decode(String.self, forKey: .date)
        let dateFormatter = ISO8601DateFormatter() // Adjusted for appointment date format
        guard let date = dateFormatter.date(from: dateString) else {
            throw DecodingError.dataCorruptedError(forKey: .date, in: container, debugDescription: "Invalid date format")
        }
        self.date = date
        
        title = try container.decode(String.self, forKey: .title)
        price = try container.decode(Double.self, forKey: .price)
    }
}
