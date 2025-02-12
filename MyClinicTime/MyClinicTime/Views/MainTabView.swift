//
//  MainTabView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 11/02/2025.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var sessionManager: SessionManager
    
    @State var user: User
    
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)
            
            AvailableAppointmentsView(user: user)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Appointments")
                }
                .tag(1)
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainTabView(user: UserViewModel().allUsers.first!)
        .environmentObject(UserViewModel())
        .environmentObject(SessionManager())
}
