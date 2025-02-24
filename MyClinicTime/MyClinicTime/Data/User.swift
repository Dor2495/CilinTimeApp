import Foundation

struct User: Identifiable, Equatable, Decodable, Encodable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var isLoggedIn: Bool
    var appointments: [Appointment]

//    init(firstName: String, lastName: String, dateOfBirth: Date, email: String, password: String) {
//        self.id = UUID().uuidString
//        self.firstName = firstName
//        self.lastName = lastName
//        self.dateOfBirth = dateOfBirth
//        self.email = email
//        self.password = password
//        self.isLoggedIn = false
//        self.appointments = []
//    }
//    
//    // Custom date decoding
//    private enum CodingKeys: String, CodingKey {
//        case id, firstName, lastName, dateOfBirth, email, password, isLoggedIn, appointments
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        id = try container.decode(String.self, forKey: .id)
//        firstName = try container.decode(String.self, forKey: .firstName)
//        lastName = try container.decode(String.self, forKey: .lastName)
//        
//        // Custom date decoding for dateOfBirth
//        let dateString = try container.decode(String.self, forKey: .dateOfBirth)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd" // Adjusted for dateOfBirth format
//        guard let date = dateFormatter.date(from: dateString) else {
//            throw DecodingError.dataCorruptedError(forKey: .dateOfBirth, in: container, debugDescription: "Invalid date format")
//        }
//        self.dateOfBirth = date
//        
//        email = try container.decode(String.self, forKey: .email)
//        password = try container.decode(String.self, forKey: .password)
//        isLoggedIn = try container.decode(Bool.self, forKey: .isLoggedIn)
//        appointments = try container.decode([Appointment].self, forKey: .appointments)
//    }
}
