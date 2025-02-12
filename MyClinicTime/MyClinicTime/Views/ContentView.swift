//
//  ContentView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userVeiwMode = UserViewModel()
    @StateObject var sessionManager = SessionManager()
   
    
    var body: some View {
        NavigationStack {
            if let activeUser = sessionManager.activeUser, activeUser.isLoggedIn {
                MainTabView(user: sessionManager.activeUser!)
            } else {
                LogInView()
            }
        }
        .environmentObject(userVeiwMode)
        .environmentObject(sessionManager)
    }
}

#Preview {
    ContentView()
}
