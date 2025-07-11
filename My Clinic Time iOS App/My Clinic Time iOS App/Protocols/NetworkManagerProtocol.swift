//
//  NetworkManagerProtocol.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 10/07/2025.
//

import Foundation

protocol NetworkManagerProtocol {
    func requestCategories<T: Codable>() async throws -> T?
}
    
