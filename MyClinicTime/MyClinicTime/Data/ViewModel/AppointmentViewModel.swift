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
    
    func save() {
        saveAppointments()
    }
    
    private func loadAppointments() {
        guard let url = itemsFileURL else {
            print("❌ Error: Invalid file URL")
            return
        }

        if !FileManager.default.fileExists(atPath: url.path) {
            print("ℹ️ Appointments file does not exist. Creating an empty file.")
            saveAppointments() // This will create the file
        }
        
        print("appointments file URL: \(url.path)")
        do {
            let rawData = try String(contentsOf: url, encoding: .utf8)
            print("📂 Raw JSON Data: \(rawData)")
        } catch {
            print("❌ Failed to read JSON: \(error)")
        }
        
        do {
            let data = try Data(contentsOf: url)
            print("Data: \(data)")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            print("Decoder created: \(decoder)\n")
            let decodedItems = try decoder.decode([Appointment].self, from: data)
            print("Decoded Items:\n \(decodedItems)\n")
            print(decodedItems)
            self.allAppointments = decodedItems
        } catch {
            print("Error loading appointments: \(error.localizedDescription)")
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
