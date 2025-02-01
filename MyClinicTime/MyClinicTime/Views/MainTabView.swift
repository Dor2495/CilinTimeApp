//
//  MainTabView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var data: UserViewModel
    
    @State private var selectedTab: Int = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            
            //MARK: home tab
            HomeView()
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
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(3)
        }
    }
}

#Preview {
    let user = User(firstName: "firstname", lastName: "lastName", dateOfBirth: Date.now, email: "email@gmail.com", password: "password")
    MainTabView()
        .environmentObject(UserViewModel(user: user))
        .environmentObject(AppointmentsViewModel())
}
