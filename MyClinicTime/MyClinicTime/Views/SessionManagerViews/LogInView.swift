//
//  LogInView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 11/02/2025.
//

import SwiftUI

struct LogInView: View {
    @EnvironmentObject var userVeiwMode: UserViewModel
    @EnvironmentObject var sessionManager: SessionManager
    
    @State var email: String = "Email@gmail.com"
    @State var password: String = "password"
    
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 30) {
                
                // TITLE
                Text("My Clinic Time")
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .padding(.bottom, 30)
                    .multilineTextAlignment(.center)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Enter Email")
                    TextField("Email", text: $email)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Enter Password")
                    SecureField("Password", text: $password)
                }
                
                Button {
                    if  userVeiwMode.validation(email, password) {
                        let user = userVeiwMode.login(email, password)
                        sessionManager.login(as: user!)
                        print("Logged in as - \(user!.email)")
                    } else {
                        print("No User Found for \(email) or Password is incorrect")
                    }
                } label: {
                    Text("Log In")
                        .bold()
                }
                .buttonStyle(.borderedProminent)
            }
            .textFieldStyle(.roundedBorder)
            .padding(.horizontal, 30)
        }
    }
}

#Preview {
    @Previewable @StateObject var userVeiwMode = UserViewModel()
    @Previewable @State var activeUser: User? = UserViewModel().allUsers.first!
    LogInView()
        .environmentObject(userVeiwMode)
        .environmentObject(SessionManager())
}
