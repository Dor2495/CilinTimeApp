//
//  LoginResponse.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 08/07/2025.
//

import Foundation
import Combine

struct LoginResponse: Codable, Equatable {
    
    var message: String
    
    var token: String?
    var phone: String?
    var firstName: String?
    var lastName: String?
    var isProfileComplete: Bool?
    
 
    enum CodingKeys: String, CodingKey {
        case message
        case token
        case phone
        case firstName = "customer_first_name"
        case lastName = "customer_last_name"
        case isProfileComplete = "is_profile_complete"
    }
}
