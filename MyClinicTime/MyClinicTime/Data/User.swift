import Foundation

struct User: Identifiable, Equatable, Decodable, Encodable {
    var id: String
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var isLoggedIn: Bool
    var appointments: [Appointment]

}
