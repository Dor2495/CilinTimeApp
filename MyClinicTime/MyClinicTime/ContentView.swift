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
    
    @State var sessionManager = SessionManager()
    
    var body: some View {
        
        
        
        NavigationStack {
            if userviewModel.allUsers[0].isLoggedIn {
                MainTabView()
            }
            else {
                LoginView()
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
