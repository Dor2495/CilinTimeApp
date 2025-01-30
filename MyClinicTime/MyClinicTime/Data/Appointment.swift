//
//  Appointment.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import Foundation

struct Appointment: Identifiable, Equatable {
    var id: String = UUID().uuidString
    var date: Date
    var title: String
    var price: Double
    
    func getDayOfWeek() -> Int {
        return date.dayInt
    }
}

struct mockData {
    var appointments = [
        Appointment(date: Date(), title: "Pedicure", price: 100),
        Appointment(date: Date(), title: "Menicure", price: 200)
    ]
}
