//
//  SignUpView.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 06/07/2025.
//

import SwiftUI

struct SignUpView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var isLoading: Bool = false
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phone: String = ""
    
    @FocusState private var focusedField: Field?
    
    enum Field: Hashable {
        case email, password, phone
    }
    
    var isFormValid: Bool {
        email.contains("@") && !phone.isEmpty &&
        email.contains(".") && !password.isEmpty
        
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 0) {
                    // Header Section
                    VStack(spacing: 16) {
                        // App Icon or Logo placeholder
                        Image(systemName: "person.fill.badge.plus")
                            .font(.system(size: 60))
                            .foregroundColor(.accentColor)
                        
                        VStack(spacing: 8) {
                            Text("Welcome")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("Create new account")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.top, 60)
                    .padding(.bottom, 50)
                    
                    // Form Section
                    VStack(alignment: .leading, spacing: 20) {
                        
                        // Email Field
                        CustomInputField(title: "Email", prompt: "Enter Your Email", text: $email)
                            .focused($focusedField, equals: .email)
                            .onSubmit { focusedField = .email }
                        
                        // Password Field
                        CustomInputField(title: "Password", prompt: "Enter Your Password", secureField: true, text: $password)
                                .focused($focusedField, equals: .password)
                                .onSubmit { focusedField = .phone }
                        
                        CustomInputField(title: "Phone", prompt: "Enter Your Phone", text: $phone)
                                .keyboardType(.numberPad)
                                .focused($focusedField, equals: .phone)
                                .onSubmit { if isFormValid { Task { await register(email, password, phone) }}}
                        
                        
                        HStack {
                            Text("Already have an account?")
                                .foregroundStyle(.secondary)
                            Spacer()
                            Button("Log In") {
                                dismiss()
                            }
                        }
                        
                        // Login Button
                        Button {
                            Task { await register(email, password, phone) }
                        } label: {
                            HStack {
                                if isLoading {
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                        .scaleEffect(0.8)
                                } else {
                                    Text("Sign Up")
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
                        .disabled(!isFormValid || isLoading)
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
            .navigationBarBackButtonHidden()
        }
        
    }
    
    func register(_ email: String, _ password: String, _ phone: String) async {
        do {
            let url = URL(string: "http://localhost:3000/auth/register")
            var request = URLRequest(url: url!)
            
            
            let registerRequest = RegisterRequest(email: email, password: password, phone: phone)
            let encodedRequest = try JSONEncoder().encode(registerRequest)
            
            request.httpMethod = "POST"
            request.httpBody = encodedRequest
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            // MARK:  response 201 -> GOOD
            
            print(String(data: data, encoding: .utf8) as Any)
            
            let registerResponse = try JSONDecoder().decode(RegisterResponse.self, from: data)
            print(registerResponse)
            
            
        } catch {
            print(error.localizedDescription)
        }
    }
}

#Preview {
    SignUpView()
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
