//
//  LoginView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 60) {
                
                Text("Welcome to MyClinicTime")
                    .font(.system(size: 38, weight: .bold, design: .serif))
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 20) {
                    UserInput(text: $email,
                              description: "E-mail",
                              contentType: .username)
                    
                    UserInput(text: $password,
                              description: "Password",
                              contentType: .password)
                }
                .padding()
                
                Button(action: {
                    // MARK: log user in
                    login(email: email, password: password)
                    
                }) {
                    Text("Log In")
                        .bold()
                        .frame(width: 300, height: 30)
                }
                .buttonStyle(.borderedProminent)
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundStyle(.gray)
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .foregroundColor(.blue)
                            .font(.system(size: 16))
                    }
                }
            }
            .padding()
            
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func login(email: String, password: String) {
        // MARK: - login function
    }
}

// returns a custom TextField
struct UserInput: View {
    @Binding var text: String
    var description: String
    var contentType: UITextContentType
    
    var body: some View {
        
        if contentType == .password {
            SecureField(description, text: $text)
                .textContentType(contentType)
                .textFieldStyle(.roundedBorder)
        } else {
            TextField(description, text: $text)
                .textContentType(contentType)
                .textFieldStyle(.roundedBorder)
        }
    }
}

#Preview {
    LoginView()
        .environment(UserViewModel())
        .environment(AppointmentViewModel())
}
