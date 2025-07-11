//
//  CustomSubmitButton.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 10/07/2025.
//

import SwiftUI

struct CustomSubmitButton<ButtonLable: View>: View {

    let disabled: Bool
    let action: () -> Void
    @ViewBuilder var content: () -> ButtonLable
    
    
    var body: some View {
        Button {
            action()
        } label: {
            content()
        }
        .disabled(disabled)
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(!disabled ? Color.accentColor : Color.gray.opacity(0.3))
        )
        .foregroundColor(.white)
    }
}

#Preview {
    CustomSubmitButton(disabled: true, action: {} ) {

    }
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
