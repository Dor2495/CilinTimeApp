//
//  ContentView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(UserViewModel.self) var userviewModel: UserViewModel
    @Environment(AppointmentViewModel.self) var appointmentviewModel: AppointmentViewModel
    @Environment(SessionManager.self) var sessionManager: SessionManager
    
    var body: some View {
        NavigationStack {
            
            if sessionManager.activeUser == nil {
                LoginView()
            } else if sessionManager.activeUser!.isLoggedIn == true {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(UserViewModel())
        .environment(SessionManager())
        .environment(AppointmentViewModel())
}
