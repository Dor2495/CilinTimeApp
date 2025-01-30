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
