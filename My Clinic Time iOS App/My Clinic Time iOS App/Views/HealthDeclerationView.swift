//
//  HealthDeclerationView.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 06/07/2025.
//

import SwiftUI

struct HealthDeclerationView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    HealthDeclerationView()
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
