//
//  MyClinicTimeApp.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

@main
struct MyClinicTimeApp: App {
    @State var UserviewModel = UserViewModel()
    @State var AppointmentviewModel = AppointmentViewModel()
    
    var body: some Scene {
        WindowGroup {
//            if viewModel.active.isLoggedIn {
                MainTabView()
//            } else {
//                ContentView()
//            }
        }
        .environment(UserviewModel)
        .environment(AppointmentviewModel)
    }
}
