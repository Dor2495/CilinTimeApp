//
//  LoginView.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 06/07/2025.
//

import SwiftUI
import ToastUI

struct LoginView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    @State private var email: String = "emaik@service.com"
    @State private var password: String = "paswword!"
    
    @FocusState private var focusedField: Field?
    
    var onToast: (Bool, ToastConfig) -> Void
    
    enum Field: Hashable {
        case email, password
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    // Header Section
                    VStack(spacing: 16) {
                        // App Icon or Logo placeholder
                        Image(systemName: "key.2.on.ring")
                            .font(.system(size: 60))
                            .foregroundColor(.accentColor)
                        
                        VStack(spacing: 8) {
                            Text("Welcome Back")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("Sign in to your account")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.top, 60)
                    .padding(.bottom, 50)
                    
                    // Form Section
                    VStack(alignment: .leading, spacing: 20) {
                        // Email Field
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Email")
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            TextField("Enter your email", text: $email)
                                .textFieldStyle(CustomTextFieldStyle())
                                .keyboardType(.emailAddress)
                                .textInputAutocapitalization(.never)
                                .focused($focusedField, equals: .email)
                                .onSubmit { focusedField = .email }
                        }
                        
                        // Password Field
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Password")
                                .font(.headline)
                                .foregroundColor(.primary)
                            
                            SecureField("Enter your password", text: $password)
                                .textFieldStyle(CustomTextFieldStyle())
                                .focused($focusedField, equals: .password)
                                .onSubmit { if isFormValid { Task { await login() }}}
                        }
                        
                        HStack {
                            Button("Forgot Password?") {
                                
                            }
                            Spacer()
                            NavigationLink("Sign Up") {
                                SignUpView()
                            }
                        }
                        
                        // Login Button
                        Button { Task { await login() } } label: {
                            HStack {
                                if userVM.isLoading {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                        .scaleEffect(0.8)
                                } else {
                                    Text("Sign In")
                                        .fontWeight(.semibold)
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(isFormValid ? Color.accentColor : Color.gray.opacity(0.3))
                            )
                            .foregroundColor(.white)
                        }
                        .disabled(!isFormValid || userVM.isLoading)
                        .padding(.top, 10)
                    }
                    .padding(.horizontal, 32)
                    
                    Spacer()
                }
            }
            .background(Color("appBg").ignoresSafeArea())
            .onTapGesture {
                focusedField = nil
            }
        }
    }
    
    private var isFormValid: Bool {
        !email.isEmpty && email.contains("@") && !password.isEmpty
    }

    private func login() async {
        focusedField = nil
        let response = await userVM.login(email, password)
        userVM.loginResponse = response
        
        if response.message.contains("successful") {
            withAnimation { onToast(
                true,
                ToastConfig(
                    title: "Logged In Successfully!",
                    message: "Welcome \(userVM.loginResponse?.firstName ?? "")",
                    systemImage: "checkmark",
                    actionType: .custom(
                        "person",
                        .green)))
            }
            userVM.isLoggedIn = true
            
        } else {
            withAnimation {
                onToast(
                    true,
                    ToastConfig(
                        title: "Log-In Failed!",
                        actionType: .cancel
                    )
                )
            }
        }
    }
}

// Custom Text Field Style
struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray6))
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
            )
            .font(.body)
    }
}

#Preview {
    LoginView { _, _ in }
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}

