//
//  AppointmentStatus.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 07/07/2025.
//

import Foundation

enum AppointmentStatus: String, Codable {
    case cancelled
    case completed
    case confirmed
    case pending
    
    var displayName: String {
        switch self {
        case .cancelled:
            return "Cancelled"
        case .completed:
            return "Completed"
        case .confirmed:
            return "Confirmed"
        case .pending:
            return "Pending"
        }
    }
}
