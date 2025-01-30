//
//  User.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import Foundation

struct User: Identifiable {
    var id: String = UUID().uuidString
    
    var firstName: String
    var lastName: String
    var dateOfBirth: Date
    var email: String
    var password: String
    
    var isLoggedIn: Bool = false
    var appointments: [Appointment] = [
        Appointment(date: Date(), title: "Pedicure", price: 100),
        Appointment(date: Date(), title: "Menicure", price: 200),
        Appointment(date: Date(), title: "3", price: 100),
        Appointment(date: Date(), title: "2", price: 200),
        Appointment(date: Date(), title: "6", price: 100),
        Appointment(date: Date(), title: "4", price: 200),
        Appointment(date: Date(), title: "1", price: 100),
        Appointment(date: Date(), title: "7", price: 200),
    ]
}
