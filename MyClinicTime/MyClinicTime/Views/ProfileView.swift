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
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Details")) {
                        Text(userviewModel.allUsers[0].firstName)
                        Text(userviewModel.allUsers[0].lastName)
                        Text(userviewModel.allUsers[0].email)
//                        Text("\(userviewModel.allUsers[0].dateOfBirth)")
                    }
                }
            }
            
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(action: {
                        // MARK: - log out
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
}
