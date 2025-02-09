//
//  MainTabView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

struct MainTabView: View {
    @Environment(SessionManager.self) var sessionManager: SessionManager
    
    @State private var selectedTab: Int = 1
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            //MARK: home tab
            HomeView(isLogeedIn: $isLoggedIn)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(1)
            
            //MARK: new app. tab
            MakeAnAppointment()
                .tabItem {
                    Label("New Appointment", systemImage: "note.text.badge.plus")
                }
                .tag(2)
            
            //MARK: profile tab
            ProfileView(isLoggedIn: $isLoggedIn)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(3)
        }
    }
}

#Preview {
    @Previewable @State var isLoggedIn: Bool = false
    MainTabView(isLoggedIn: $isLoggedIn)
        .environment(UserViewModel())
        .environment(AppointmentViewModel())
        .environment(SessionManager())
}
