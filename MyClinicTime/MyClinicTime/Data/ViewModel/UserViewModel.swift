//
//  ViewModel.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 03/02/2025.
//

import Foundation

@Observable
class UserViewModel {
    var allUsers: [User] = [] {
        didSet {
            saveUsers()
        }
    }
    
    var activeUser: User?
    
    private let usersFileURL: URL?

    init() {
        // Get the URL for the users.json file in the app's documents directory.
        usersFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("UserData.json")
        loadUsers()
    }
    
    func save() {
        saveUsers()
    }
    
    private func loadUsers() {
        guard let url = usersFileURL, FileManager.default.fileExists(atPath: url.path) else
        { return } // Check file exists
        
        print("Users file URL: \(url.path)")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
    
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
//            print("users file URL: \(url.path)")
        do {
            let data = try Data(contentsOf: url)
            let decodedUsers = try decoder.decode([User].self, from: data)
            self.allUsers = decodedUsers
            print(allUsers)
        } catch {
            print("Error loading users: \(error)") // Important: Handle errors
            // Consider showing an alert to the user or using a default value if loading fails.
        }
    }
    
    private func saveUsers() {
        guard let url = usersFileURL else { return }
        
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        do {
            let encodedData = try JSONEncoder().encode(allUsers)
            try encodedData.write(to: url)
        } catch {
            print("Error saving users: \(error)") // Important: Handle errors
        }
    }
}


