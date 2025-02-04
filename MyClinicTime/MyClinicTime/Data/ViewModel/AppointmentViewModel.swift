//
//  AppointmentViewModel.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 04/02/2025.
//

import Foundation

@Observable
class AppointmentViewModel {
    var allAppointments: [Appointment] = [] {
        didSet {
            saveAppointments()
        }
    }
    
    private let itemsFileURL: URL?

    init() {
        itemsFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("AppointmetData.json")
        loadAppointments()
    }
    
    private func loadAppointments() {
        guard let url = itemsFileURL, FileManager.default.fileExists(atPath: url.path)  else {
            print("Error in loading URL")
            return
        }
        
        print("appointments file URL: \(url.path)")
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .deferredToDate
            let decodedItems = try decoder.decode([Appointment].self, from: data)
            self.allAppointments = decodedItems
        } catch {
            print("Error loading appointments: \(error)")
        }
    }

    private func saveAppointments() {
        guard let url = itemsFileURL else { return }
        do {
            let encodedData = try JSONEncoder().encode(allAppointments)
            try encodedData.write(to: url)
        } catch {
            print("Error saving items: \(error)")
        }
    }
}
