//
//  SessionManager.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 06/02/2025.
//

import Foundation
import SwiftUI

class SessionManager: ObservableObject {
    @Published var activeUser: User? = nil
    
    func login(as user: User) {
        activeUser = user
        activeUser?.isLoggedIn = true
        print("Active user: \(String(describing: activeUser))")
    }
    
    func logout() {
        activeUser?.isLoggedIn = false
        activeUser = nil
        print("Logged out: \(String(describing: activeUser))")
    }
}
