//
//  ProfileView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 29/01/2025.
//

import SwiftUI

struct ProfileView: View {
    @Environment(UserViewModel.self) var userviewModel: UserViewModel
    @Environment(AppointmentViewModel.self) var appointmentviewModel: AppointmentViewModel
    @Environment(SessionManager.self) var sessionManager: SessionManager
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Details")) {
                        Text(sessionManager.firstName)
//                        Text(sessionManager.activeUser!.lastName)
//                        Text(sessionManager.activeUser!.email)
//                        Text("\(sessionManager.allUsers[0].dateOfBirth)")
                    }
                }
            }
            
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        // MARK: - log out
                        print("logging out as: \(sessionManager.firstName)")
                        sessionManager.logout()
                        print("Logged out successfully")
                    }) {
                        Text("Logout")
                            .bold()
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
}

#Preview {
    ProfileView()
        .environment(UserViewModel())
        .environment(AppointmentViewModel())
        .environment(SessionManager())
}
