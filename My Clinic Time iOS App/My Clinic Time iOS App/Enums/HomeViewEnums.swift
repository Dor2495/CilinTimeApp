//
//  HomeViewEnums.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 07/07/2025.
//

import Foundation

enum SortingBy: String, CaseIterable {
    case date
    case status
    
    var displayName: String {
        switch self {
        case .date: return "Date"
        case .status: return "Status"
        }
    }
}
