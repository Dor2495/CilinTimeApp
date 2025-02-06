//
//  DateFormatterExtension.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 06/02/2025.
//

import Foundation

extension DateFormatter {
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        return formatter
    }()
}
