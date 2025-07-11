//
//  RootView.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 06/07/2025.
//

import SwiftUI
import Combine
import ToastUI

struct RootView: View {
    @EnvironmentObject var screenVM: ScreensViewModel
    @EnvironmentObject var homeVM: HomeViewModel
    @EnvironmentObject var userVM: UserViewModel
    
    var onToast: (Bool, ToastConfig) -> Void
    
    var body: some View {
        TabView(selection: $screenVM.selectedScreen) {
            Tab("Home", systemImage: "list.bullet", value: Screens.home) {
                HomeView() { show, config in
                    
                }
            }
            
            Tab("New Appointment", systemImage: "plus", value: Screens.newAppointment) {
                NewAppointmentView()
            }
            
            Tab("Profile", systemImage: "person", value: Screens.profile) {
                if userVM.user != nil {
                    ProfileView() { show,config in
                        withAnimation { userVM.logout() }
                        onToast(show, config)
                    }
                } else {
                    ContentUnavailableView(
                        "There is no User Logged In",
                        systemImage: "questionmark.app.fill",
                        description: Text("Error Accured While Loading User Data")
                    )
                }
            }
        }
        .background(Color("appBg").ignoresSafeArea())
    }
}

#Preview {
    RootView(onToast: { _, _ in})
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
