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
        usersFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("newUserData.json")
        loadUsers()
    }
    
    func save() {
        saveUsers()
    }
    
    private func loadUsers() {
//        guard let url = usersFileURL, FileManager.default.fileExists(atPath: url.path) else
//        { return } // Check file exists
        
        guard let url = usersFileURL else {
            print("❌ Error: Invalid file URL")
            return
        }

        if !FileManager.default.fileExists(atPath: url.path) {
            print("ℹ️ Appointments file does not exist. Creating an empty file.")
            saveUsers() // This will create the file
            print("File was created successfully.")
        }
        
        
        
        print("Users file URL: \(url.path)")
        
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
    
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(.dateFormatter)
            print("users file URL: \(url.path)")
        do {
            let data = try Data(contentsOf: url)
            let decodedUsers = try decoder.decode([User].self, from: data)
            self.allUsers = decodedUsers
            print(allUsers)
        } catch {
            print("Error loading users: \(error)\n\n") // Important: Handle errors
            // Consider showing an alert to the user or using a default value if loading fails.
        }
    }
    
    private func saveUsers() {
        guard let url = usersFileURL else { return }
        
        do {
//            let dateFormatter = DateFormatter()
//            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
            
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .formatted(.dateFormatter)
            
            let encodedData = try encoder.encode(allUsers)
            try encodedData.write(to: url)
        } catch {
            print("Error saving users: \(error)") // Important: Handle errors
        }
    }
}


