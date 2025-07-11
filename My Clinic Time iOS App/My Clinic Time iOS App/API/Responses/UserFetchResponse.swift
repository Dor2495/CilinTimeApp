//
//  UserFetchResponse.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 08/07/2025.
//

import Foundation

struct UserFetchResponse: Codable, Equatable {
    
    var firstName: String
    var lastName: String
    var email: String
    var phone: String
    var address: String
    var birthday: String
    var isProfileComplete: Bool
    var isHealthDeclarationReviewRequired: Bool
    var not_allowed_treatments: [String]?
    var token: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "customer_first_name"
        case lastName = "customer_last_name"
        case email = "email"
        case phone = "phone"
        case address = "address"
        case birthday = "birth_date"
        case isProfileComplete = "is_profile_complete"
        case isHealthDeclarationReviewRequired = "is_health_declaration_review_required"
        case not_allowed_treatments = "not_allowed_treatments"
        case token = "fcm_token"
    }
}
