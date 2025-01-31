//
//  AppointmentsViewModel.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 31/01/2025.
//

import Foundation
import SwiftUI

class AppointmentsViewModel: ObservableObject {
    @Published private(set) var availableAppointment: [Appointment] = [
        Appointment(date: User.dateFormatter().date(from: "2025.12.01")!, title: "Pedicure", price: 100),
        Appointment(date: User.dateFormatter().date(from: "2025.12.02")!, title: "Menicure", price: 200),
        Appointment(date: User.dateFormatter().date(from: "2025.12.03")!, title: "Facial", price: 150),
        Appointment(date: User.dateFormatter().date(from: "2025.12.04")!, title: "Massage", price: 250),
        Appointment(date: User.dateFormatter().date(from: "2025.12.05")!, title: "Haircut", price: 80),
        Appointment(date: User.dateFormatter().date(from: "2025.12.06")!, title: "Nail Art", price: 120),
        Appointment(date: User.dateFormatter().date(from: "2025.12.07")!, title: "Waxing", price: 90),
        Appointment(date: User.dateFormatter().date(from: "2025.12.08")!, title: "Spa Treatment", price: 300),
    ]
    
    @Published private(set) var unAvailableAppointment: [Appointment] = []
}
