//
//  RegisterRequest.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 10/07/2025.
//

import Foundation

struct RegisterRequest: Codable {
    var email: String
    var password: String
    var phone: String
}
