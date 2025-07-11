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
    
    @State private var email: String = "myclinictimeuser@gmail.com"
    @State private var password: String = "Aa123456!"
    
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
                        CustomInputField(title: "Email", prompt: "Enter your email", text: $email)
                            .focused($focusedField, equals: Field.email)
                            .onSubmit { focusedField = .password }
                        
                        // Password Field
                        CustomInputField(title: "Password", prompt: "Enter your password", secureField: true, text: $password)
                            .focused($focusedField, equals: .password)
                            .onSubmit {
                                let loginRequest = LoginRequest(email: email, password: password)
                                if isFormValid {
                                    Task {
                                        await login(loginRequest)
                                    }
                                }
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
                        CustomSubmitButton(disabled: !isFormValid) { Task { await login(LoginRequest(email: email, password: password)) } }
                            content: {
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
                                }
                            }
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
    
    private var isFormValid: Bool {
        !email.isEmpty && email.contains("@") && !password.isEmpty
    }

    private func login(_ loginRequest: LoginRequest) async {
        do {
            focusedField = nil
            let response: LoginResponse = try await userVM.login(with: loginRequest)
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
        } catch {
            print("Error Login in...")
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
