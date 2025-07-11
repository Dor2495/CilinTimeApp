//
//  EdittingProfileFormView.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 09/07/2025.
//

import SwiftUI

struct EdittingProfileFormView: View {
    @Binding var firstName: String
    @Binding var lastName: String
    @Binding var email: String
    @Binding var phone: String
    @Binding var address: String
    @Binding var birthday: Date
    
    var body: some View {
        TextField("First Name", text: $firstName, prompt: Text("Enter First Name"))
        TextField("Last Name", text: $lastName, prompt: Text("Enter Last Name"))
        TextField("Email", text: $email, prompt: Text("Enter Email"))
        TextField("Phone", text: $phone, prompt: Text("Enter Phone"))
        TextField("Address", text: $address, prompt: Text("Enter Address"))
        DatePicker("Birthday", selection: $birthday, displayedComponents: .date)
    }
}

#Preview {
    EdittingProfileFormView(
        firstName: .constant("John"),
        lastName: .constant("Doe"),
        email: .constant("john.doe@example.com"),
        phone: .constant("123-456-7890"),
        address: .constant("123 Main Street"),
        birthday: .constant(Date())
    )
    .environmentObject(ScreensViewModel())
    .environmentObject(HomeViewModel())
    .environmentObject(UserViewModel())
    .environmentObject(NewAppointmentViewModel())
    .environmentObject(ToastViewModel())
}
