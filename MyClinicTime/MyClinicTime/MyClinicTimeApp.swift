//
//  MyClinicTimeApp.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

@main
struct MyClinicTimeApp: App {
    @StateObject var data = UserViewModel(user: User(firstName: "default", lastName: "default", dateOfBirth: Date.now, email: "email@email.com", password: "password"))
    
    var body: some Scene {
        WindowGroup {
            if data.activeUser!.isLoggedIn {
                MainTabView()
            } else {
                ContentView()
            }
        }
        .environmentObject(data)
    }
}
