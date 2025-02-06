//
//  UserExtension.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 05/02/2025.
//

import Foundation
extension UserViewModel {
    func login(_ email: String, _ password: String) -> User? {
        return allUsers.first { $0.email == email && $0.password == password }
    }
}
