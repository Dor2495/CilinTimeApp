//
//  APIConfiguration.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 10/07/2025.
//

import Foundation

struct APIConfiguration {
    static let debugBaseURLString = "http://localhost"
//    static let baseURLString = "http://10.0.0.21"
    static let port: String = ":3000"
    
    
    static var url: String {
        "\(APIConfiguration.debugBaseURLString)\(APIConfiguration.port)"
    }
    static let endpoints = APIEndpoints()
}

struct APIEndpoints {
    let login = "/auth/login"
    let fetchUser = "/customers"
    let fetchUserAppointments = "/appointments/user-appointments"
    let fetchCategories = "/categories"
}
