//
//  RegisterResponse.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 10/07/2025.
//

import Foundation

struct RegisterResponse: Codable {
    var message: String
    
    enum CodingKeys: String, CodingKey {
        case message = "message"
    }
}
