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

func save<T: Encodable>(_ value: T, as filename: String) {
    let data: Data
    
    do {
        data = try JSONEncoder().encode(value)
    } catch {
        fatalError("Couldn't encode \(value) as JSON: \(error.localizedDescription)")
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

