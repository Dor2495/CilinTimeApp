//
//  AppointmentModel.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 06/07/2025.
//

import Foundation

struct UserAppointmentFetchResponse: Identifiable, Codable, Hashable {
    var id: Int
    var treatmentName: String
    
    var date: String
    var beginTime: String
    var completeTime: String
    
    var displayScheduledDate: String {
        do {
            let parsedDate = try Date(date, strategy: .iso8601)
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"

            // Parse and reformat beginTime to "HH-mm"
            let beginTimeFormatter = DateFormatter()
            beginTimeFormatter.dateFormat = beginTime.contains(":") ? "HH:mm:ss" : "HH-mm-ss"
            if let timeDate = beginTimeFormatter.date(from: beginTime) {
                let displayBeginTimeFormatter = DateFormatter()
                displayBeginTimeFormatter.dateFormat = "HH:mm"
                let formattedBeginTime = displayBeginTimeFormatter.string(from: timeDate)
                return "On \(dateFormatter.string(from: parsedDate)) At \(formattedBeginTime)"
            } else {
                return "On \(dateFormatter.string(from: parsedDate)) At 00:00"
            }
        } catch {
            return "Invalid date"
        }
    }
    
    var fetchedStatus: String
    
    var status: AppointmentStatus {
        switch fetchedStatus {
        case "confirmed": return .confirmed
        case "canceled": return .cancelled
        case "pending": return .pending
        case "completed": return .completed
        default:
            return .pending
        }
    }
    
    var arrivalConfirmation: Int
    var isConfirmed: Bool { arrivalConfirmation == 1 }
    
    
    var timeRange: String

    enum CodingKeys: String, CodingKey {
        case id = "appointment_id"
        case treatmentName = "treatment_name"
        case date = "date"
        case beginTime = "treatment_beginning_time_local"
        case completeTime = "treatment_completion_time_local"
        case fetchedStatus = "status"
        case arrivalConfirmation = "arrival_confirmation"
        case timeRange = "timeRange"
    }
    
    init(id: Int, treatmentName: String, date: String, beginTime: String, completeTime: String, fetchedStatus: String, arrivalConfirmation: Int, timeRange: String) {
        self.id = id
        self.treatmentName = treatmentName
        self.date = date
        self.beginTime = beginTime
        self.completeTime = completeTime
        self.fetchedStatus = fetchedStatus
        self.arrivalConfirmation = arrivalConfirmation
        self.timeRange = timeRange
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        treatmentName = try container.decode(String.self, forKey: .treatmentName)
        date = try container.decode(String.self, forKey: .date)
        beginTime = try container.decode(String.self, forKey: .beginTime)
        completeTime = try container.decode(String.self, forKey: .completeTime)
        fetchedStatus = try container.decode(String.self, forKey: .fetchedStatus)
        arrivalConfirmation = try container.decode(Int.self, forKey: .arrivalConfirmation)
        timeRange = try container.decode(String.self, forKey: .timeRange)
    }
}

