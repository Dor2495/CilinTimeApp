//
//  ProfileView.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 06/07/2025.
//

import SwiftUI
import ToastUI

struct ProfileView: View {
    @EnvironmentObject var userVM: UserViewModel
    @State private var isEditting: Bool = false
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmNewPassword: String = ""
    
    @State private var birthday: Date = Date()
    @State private var confirmLogOut: Bool = false
    
    var handleLogout: (Bool, ToastConfig) -> Void
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Form {
                    Section {
                        if isEditting {
                            EdittingProfileFormView(
                                firstName: $firstName,
                                lastName: $lastName,
                                email: $email,
                                phone: $phone,
                                address: $address,
                                birthday: $birthday
                            )
                        } else {
                            if let user = userVM.user {
                                ProfileDetailsFormView(user: user)
                            }
                        }
                    } header: {
                        Text("DETAILS")
                    }
                    
                    if isEditting {
                        Section {
                            SecureField("Current Password", text: $currentPassword, prompt: Text("Enter Current Password"))
                                .textContentType(.password)
                            
                            SecureField("New Password", text: $newPassword, prompt: Text("Enter New Password"))
                                .textContentType(.newPassword)
                            
                            SecureField("Confirm New Password", text: $confirmNewPassword, prompt: Text("Confirm New Password"))
                                .textContentType(.newPassword)
                        } header: {
                            Text("PASSWORD")
                        }
                    }
                }
                .formStyle(.grouped)
            }
            .animation(.easeInOut, value: isEditting)
            .navigationTitle(isEditting ? "Edit Profile" : "Profile")
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    HStack {
                        if !isEditting {
                            Button {
                                // ACTION
                            } label: {
                                Image(systemName: "heart.text.clipboard")
                            }
                            .padding(.horizontal, 5)
                        }
                        
                        Button {
                            isEditting.toggle()
                        } label: {
                            Image(systemName: isEditting ? "checkmark" : "pencil")
                        }
                        .padding(.horizontal, 5)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withAnimation { confirmLogOut = true }
                    } label: {
                        Image(systemName: "person.fill.xmark")
                            .foregroundStyle(.red)
                    }

                }
            }
        }
        .alert("Log Out?", isPresented: $confirmLogOut) {
            Button("Cancel", role: .cancel) {
                confirmLogOut = false
            }
            
            Button("LogOut", role: .destructive) {
                withAnimation {
                    handleLogout(true,
                        ToastConfig(
                            title: "Logged out!",
                            systemImage: "person.slash",
                            actionType: .custom("xmark.circle.fill", .red)
                        ))
                }
            }
        }
        .onAppear {
            if let user = userVM.user {
                firstName = user.firstName
                lastName = user.lastName
                email = user.email
                phone = user.phone
                address = user.address
            }
        }
    }
}

#Preview {
    ProfileView(handleLogout: {_,_ in })
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
