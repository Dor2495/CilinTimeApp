//
//  UserViewModel.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var activeUser: User
    
    @Published var allUsers: [User] = [
        User(firstName: "Dor", lastName: "Mizrachi", dateOfBirth: Date.now, email: "Dor2495@gmail.com", password: "password"),
        User(firstName: "Guy", lastName: "Mizrachi", dateOfBirth: Date.now, email: "Guy@gmail.com", password: "password")
    ]
    
    @Published var availableAppointment: [Appointment] = [
        Appointment(date: User.dateFormatter().date(from: "2025.12.01")!, title: "Pedicure", price: 100),
        Appointment(date: User.dateFormatter().date(from: "2025.12.02")!, title: "Menicure", price: 200),
        Appointment(date: User.dateFormatter().date(from: "2025.12.03")!, title: "Facial", price: 150),
        Appointment(date: User.dateFormatter().date(from: "2025.12.04")!, title: "Massage", price: 250),
        Appointment(date: User.dateFormatter().date(from: "2025.12.05")!, title: "Haircut", price: 80),
        Appointment(date: User.dateFormatter().date(from: "2025.12.06")!, title: "Nail Art", price: 120),
        Appointment(date: User.dateFormatter().date(from: "2025.12.07")!, title: "Waxing", price: 90),
        Appointment(date: User.dateFormatter().date(from: "2025.12.08")!, title: "Spa Treatment", price: 300),
    ]
    
    init(user: User) {
        self.activeUser = user
    }
    
    func login() {
        activeUser.isLoggedIn = true
    }
    
    func logout() {
        activeUser.isLoggedIn = false
    }
    
    func addAppointment(_ appointment: Appointment) {
        activeUser.appointments.append(appointment)
    }
    
    func deleteAppointment(at offsets: IndexSet) {
        print("deleting appointment \(offsets)")
        activeUser.appointments.remove(atOffsets: offsets)
    }
    
    func addNewUser(_ newUser: User) {
        allUsers.append(newUser)
    }
    
    func isUserExist(_ email: String, _ password: String) -> Bool {
        return allUsers.contains(where: { $0.email == email && $0.password == password })
    }
    
    func getUserByEmail(_ email: String, _ password: String) -> User? {
        if isUserExist(email, password) {
            
            return allUsers.first(where: { $0.email == email })
        } else {
            return nil
        }
    }
}
