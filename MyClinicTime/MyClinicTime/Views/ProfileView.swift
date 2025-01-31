//
//  ProfileView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 29/01/2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var data: UserViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        Text("\(data.activeUser.firstName)")
                        Text("\(data.activeUser.lastName)")
                        Text("\(data.activeUser.email)")
                        let bday = data.activeUser.dateOfBirth
                        Text("\((bday))")
                        
                    } header: {
                        Text("Details")
                    }
                }
            }
            
            .navigationTitle("Profile")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        //MARK: log out
                        data.logout()
                    } label: {
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
    let user = User(firstName: "firstname", lastName: "lastName", dateOfBirth: Date.now, email: "email@gmail.com", password: "password")
    ProfileView()
        .environmentObject(UserViewModel(user: user))
}
