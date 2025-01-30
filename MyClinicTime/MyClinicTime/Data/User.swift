//
//  User.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import Foundation

struct User: Identifiable, Equatable {
    var id: String = UUID().uuidString
    
    var firstName: String
    var lastName: String
    var dateOfBirth: Date
    var email: String
    var password: String
    
    var isLoggedIn: Bool = false
    var appointments: [Appointment] = []
    
    mutating func addAppointment(title: String, price: Double, date: Date) {
        let newAppointment = Appointment(date: date, title: title, price: price, user: self)
        appointments.append(newAppointment)
    }
    
    static func dateFormatter() -> DateFormatter {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy.MM.dd" // Ensure the format matches the date strings
            return formatter
        }
}
