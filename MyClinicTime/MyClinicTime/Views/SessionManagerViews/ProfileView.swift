//
//  SwiftUIView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 11/02/2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var sessionManager: SessionManager
    
    @State var user: User
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    
                    HStack {
                        Label(
                            user.firstName + " " + user.lastName,
                            systemImage: "person.circle.fill"
                        )
                        Spacer()
                        Image(
                            systemName: "circle.fill"
                        )
                        .foregroundStyle(
                            .green
                        )
                    }
                    Label(
                        user.email,
                        systemImage: "at.circle.fill"
                    )
                    
                    
                    HStack {
                        Spacer()
                        Button {
                            sessionManager
                                .logout()
                        } label: {
                            Text(
                                "Log Out"
                            )
                        }
                        Spacer()
                    }
                }
                .formStyle(.grouped)
                .font(
                    .headline
                )
                
                
                
                
            }
            .onAppear {
                user = userViewModel.allUsers
                    .first(
                        where: {
                            $0.id == user.id
                        })!
            }
            
            .navigationTitle(
                "Profile"
            )
        }
    }
}

#Preview {
    @Previewable @State var userVeiwMode = UserViewModel()
    @Previewable @State var activeUser: User? = UserViewModel().allUsers.first!
    ProfileView(
        user: UserViewModel().allUsers.first!
    )
    .environmentObject(
        userVeiwMode
    )
    .environmentObject(
        SessionManager()
    )
}
