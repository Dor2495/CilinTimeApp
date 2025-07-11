//
//  ActionButton.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 07/07/2025.
//

import SwiftUI

struct ActionButton<Content: View>: View {
    @ViewBuilder let buttonTitle: () -> Content
    let onTap: () -> Void
    
    var body: some View {
        Button {
            onTap()
        } label: {
            buttonTitle()
                .foregroundStyle(.black)
                .padding(.vertical, 12)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .shadow(radius: 4)
        }
        .background(RoundedRectangle(cornerRadius: 12).fill(.white))
    }
}

#Preview {
    ActionButton() {
        //
        VStack {}
    } onTap:  {}
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
