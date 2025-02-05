//
//  UserExtension.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 05/02/2025.
//

import Foundation
extension UserViewModel {
    func login(_ email: String, _ password: String) {
        if let user = allUsers.first(where: { $0.email == email && $0.password == password }) {
            activeUser = user
            activeUser?.isLoggedIn = true
            print(activeUser!)
        } else {
            print("No User Found")
        }
    }
}
