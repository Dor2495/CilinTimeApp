//
//  ViewModel.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 03/02/2025.
//

import Foundation

@Observable
class ViewModel {
    var user: User = load("UserData.json")
    var appointments: [Appointment] = load("AppointmentData.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle.")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self).")
    }
}

func saveAppointments(_ appointments: [Appointment]) {
    let filename = "AppointmentData.json"
    let data: Data
    
    do {
        data = try JSONEncoder().encode(appointments)
    } catch {
        fatalError("Couldn't encode appointments as JSON: \(error.localizedDescription)")
    }
    
    // Get the path to the Documents directory
    let fileManager = FileManager.default
    guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
        fatalError("Couldn't find the documents directory.")
    }
    
    let fileURL = documentsDirectory.appendingPathComponent(filename)
    
    do {
        try data.write(to: fileURL, options: .atomic)
    } catch {
        fatalError("\(error.localizedDescription)")
    }
}

func saveUser(_ user: User) {
    let filename = "UserData.json"
    let data: Data
    
    do {
        data = try JSONEncoder().encode(user)
    } catch {
        fatalError("Couldn't encode user as JSON: \(error.localizedDescription)")
    }
    
    // Get the path to the Documents directory
    let fileManager = FileManager.default
    guard let documentsDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else {
        fatalError("Couldn't find the documents directory.")
    }
    
    let fileURL = documentsDirectory.appendingPathComponent(filename)
    
    do {
        try data.write(to: fileURL, options: .atomic)
    } catch {
        fatalError("\(error.localizedDescription)")
    }
}

