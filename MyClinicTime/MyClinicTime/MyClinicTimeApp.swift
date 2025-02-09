//
//  MyClinicTimeApp.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

@main
struct MyClinicTimeApp: App {
    @State var userviewModel = UserViewModel()
    @State var appointmentviewModel = AppointmentViewModel()
    @State var sessionManager = SessionManager()
    
    @State var isLoggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            ContentView(isLoggedIn: $isLoggedIn)
        }
        .environment(userviewModel)
        .environment(appointmentviewModel)
        .environment(sessionManager)
    }
}
