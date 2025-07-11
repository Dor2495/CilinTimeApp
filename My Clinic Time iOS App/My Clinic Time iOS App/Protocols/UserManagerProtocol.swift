//
//  UserManagerProtocol.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 10/07/2025.
//

import Foundation

protocol UserManagerProtocol {
    
    func login<T: Codable>(with loginRequest: LoginRequest) async throws -> T
    func fetchUser<T: Codable>(_ phone: String) async -> T?
    func fetchUserAppointments<T: Codable>(_ phone: String) async -> T
    
    func logout()
    
}
