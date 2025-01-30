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
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
                .tag(1)
            
            //MARK: new app. tab
            MakeAnAppointment()
                .tabItem {
                    VStack {
                        Image(systemName: "note.text.badge.plus")
                        Text("New Appointment")
                    }
                }
                .tag(2)
            
            //MARK: profile tab
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person")
                        Text("Profile")
                    }
                }
                .tag(3)
        }
    }
}

#Preview {
    let user = User(firstName: "firstname", lastName: "lastName", dateOfBirth: Date.now, email: "email@gmail.com", password: "password")
    MainTabView()
        .environmentObject(UserViewModel(user: user))
}
