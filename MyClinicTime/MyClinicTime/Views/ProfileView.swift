//
//  ProfileView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 29/01/2025.
//

import SwiftUI

struct ProfileView: View {
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Details")) {
                        Text(viewModel.activeUser!.firstName)
                        Text(viewModel.activeUser!.lastName)
                        Text(viewModel.activeUser!.email)
                        Text("\(viewModel.activeUser!.dateOfBirth)")
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
        .environment(ViewModel())
}
