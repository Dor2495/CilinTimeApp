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
    var body: some View {
        NavigationStack {
//            if let user = userviewModel.activeUser, user.isLoggedIn {
                MainTabView()
//            }
//            else {
//                LoginView()
//            }
        }
    }
}

#Preview {
    ContentView()
        .environment(UserViewModel())
        .environment(AppointmentViewModel())
}
