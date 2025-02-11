//
//  LogInView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 11/02/2025.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var userVeiwMode: UserViewModel
    
    @State var email: String = "Email@gmail.com"
    @State var password: String = "password"
    @Binding var activeUser: User?
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 30) {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Enter Email")
                    TextField("Email", text: $email)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Enter Password")
                    SecureField("Password", text: $password)
                }
                
                Button {
                    activeUser = userVeiwMode.login(email, password) ?? nil
                    if activeUser != nil {
                        activeUser!.isLoggedIn.toggle()
                        print("Logged in as - \(activeUser!.email)")
                    } else {
                        print("No User Found for \(email) or Password is incorrect")
                    }
                    
                } label: {
                    Text("Log In")
                }
                
                Button {
                    print("\(String(describing: activeUser))")
                } label: {
                    Text("Print activeUser")
                }
            }
            .padding(.horizontal, 30)
            
            .navigationTitle("Login")
        }
    }
}

#Preview {
    @Previewable @StateObject var userVeiwMode = UserViewModel()
    @Previewable @State var activeUser: User? = UserViewModel().allUsers.first!
    LogInView(activeUser: $activeUser)
        .environmentObject(userVeiwMode)
}
