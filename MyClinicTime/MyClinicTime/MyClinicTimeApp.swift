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
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environment(userviewModel)
        .environment(appointmentviewModel)
        .environment(sessionManager)
    }
}
