//
//  CustomInputField.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 10/07/2025.
//

import SwiftUI

struct CustomInputField: View {
    
    let title: String
    let prompt: String
    
    var secureField: Bool
    
    var text: Binding<String>
    
    
    init(title: String, prompt: String, secureField: Bool = false, text: Binding<String>) {
        self.title = title
        self.prompt = prompt
        self.secureField = secureField
        self.text = text
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundColor(.primary)
            
            Group {
                if secureField {
                    SecureField(prompt, text: text)
                } else {
                    TextField(prompt, text: text)
                        .keyboardType(.emailAddress)
                }
            }
            .textFieldStyle(CustomTextFieldStyle())
            .textInputAutocapitalization(.never)
        }
    }
}

#Preview {
    CustomInputField(
        title: "Email",
        prompt: "Enter your email",
        text: .constant("")
    )
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
