//
//  SessionManager.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 06/02/2025.
//

import Foundation
import SwiftUI

@Observable
class SessionManager {

    var activeUser: User? = nil
    
    var firstName: String {
        guard let activeUser = activeUser else {
            return ""
        }
        return activeUser.firstName
    }
    
    func login(as user: User) {
        activeUser = user
        activeUser!.isLoggedIn = true
    }
    
    func logout() {
        activeUser!.isLoggedIn = false
        activeUser = nil
    }
}
