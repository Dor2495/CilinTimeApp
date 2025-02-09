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
    
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationStack {
            if isLoggedIn {
                MainTabView(isLoggedIn: $isLoggedIn)
            } else {
                LoginView(isLoggedIn: $isLoggedIn)
            }
        }
    }
}

#Preview {
    @Previewable @State var isLoggedIn: Bool = false
    ContentView(isLoggedIn: $isLoggedIn)
        .environment(UserViewModel())
        .environment(SessionManager())
        .environment(AppointmentViewModel())
}
