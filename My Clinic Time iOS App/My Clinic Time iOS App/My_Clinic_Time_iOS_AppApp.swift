//
//  My_Clinic_Time_iOS_AppApp.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 06/07/2025.
//

import SwiftUI

@main
struct My_Clinic_Time_iOS_AppApp: App {
    @State var screenVM = ScreensViewModel()
    @State var homeVM = HomeViewModel()
    @State var userVM = UserViewModel()
    @State var storeVM = NewAppointmentViewModel()
    @State var toastVM = ToastViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(screenVM)
                .environmentObject(homeVM)
                .environmentObject(userVM)
                .environmentObject(storeVM)
                .environmentObject(toastVM)
        }
    }
}
