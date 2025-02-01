//
//  UserViewModel.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import Foundation
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var activeUser: User?
//    @Published var activeUserAppointments: [Appointment] = []
    
    @Published private(set) var allUsers: [User] = [
        User(firstName: "Dor", lastName: "Mizrachi", dateOfBirth: Date.now, email: "Dor2495@gmail.com", password: "password"),
        User(firstName: "Guy", lastName: "Mizrachi", dateOfBirth: Date.now, email: "Guy@gmail.com", password: "password")
    ]
    
    init(user: User) {
        self.activeUser = user
    }
    
    func login(email: String, password: String) -> Bool {
        guard let user = allUsers.first(where: { $0.email == email && $0.password == password }) else {
            return false
        }
        self.activeUser = user
        self.activeUser?.isLoggedIn = true
        return true
    }
    
    func signOut() {
        self.activeUser?.isLoggedIn = false
        self.activeUser = nil
    }
}
