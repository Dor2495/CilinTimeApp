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
    
    private let usersFileURL: URL?

    init() {
        // Get the URL for the users.json file in the app's documents directory.
        usersFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("UserData.json")
        loadUsers()
    }
    
    private func loadUsers() {
            guard let url = usersFileURL, FileManager.default.fileExists(atPath: url.path) else { return } // Check file exists
        
//            print("users file URL: \(url.path)") 
            do {
                let data = try Data(contentsOf: url)
                let decodedUsers = try JSONDecoder().decode([User].self, from: data)
                self.allUsers = decodedUsers
            } catch {
                print("Error loading users: \(error)") // Important: Handle errors
                // Consider showing an alert to the user or using a default value if loading fails.
            }
        }
    
    private func saveUsers() {
            guard let url = usersFileURL else { return }
            do {
                let encodedData = try JSONEncoder().encode(allUsers)
                try encodedData.write(to: url)
            } catch {
                print("Error saving users: \(error)") // Important: Handle errors
            }
        }
}


