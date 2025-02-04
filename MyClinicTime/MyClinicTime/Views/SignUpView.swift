//
//  LoginView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

struct SignUpView: View {
    @Environment(UserViewModel.self) var userviewModel: UserViewModel
    @Environment(AppointmentViewModel.self) var appointmentviewModel: AppointmentViewModel
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var dateOfBirth: Date = Date()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 60) {
                
                Text("Welcome to MyClinicTime")
                    .font(.system(size: 38, weight: .bold, design: .serif))
                    .multilineTextAlignment(.center)
                
                //MARK: user inputs
                VStack(spacing: 20) {
                    UserInput(text: $firstName, description: "First Name", contentType: .givenName)
                    
                    UserInput(text: $lastName, description: "Last Name", contentType: .familyName)
                    
                    DatePicker("Date Of Birth", selection: $dateOfBirth, displayedComponents: [.date])
                        .datePickerStyle(.compact)
                    
                    UserInput(text: $email,
                              description: "E-mail",
                              contentType: .username)
                    
                    UserInput(text: $password,
                              description: "Password",
                              contentType: .password)
                    
                    UserInput(text: $confirmPassword,
                              description: "Confirm Password",
                              contentType: .password)
                }
                .padding()
                
                Button {
                    // MARK: log user in
                    
                } label: {
                    Text("Sign Up")
                        .bold()
                        .frame(width: 300, height: 30)
                }
                .buttonStyle(.borderedProminent)
                //MARK: make log-in button DISABLED
                   
                HStack {
                    Text("Already have an account?")
                        .foregroundStyle(.gray)
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                            .foregroundColor(.blue)
                            .font(.system(size: 16))
                    }
                }
            }
            .padding()
            
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    SignUpView()
        .environment(UserViewModel())
        .environment(AppointmentViewModel())
}
