//
//  ActionButtons.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 07/07/2025.
//

import SwiftUI

struct ActionButtons<OnUpdateButton: View, OnCancelButton: View>: View {
    @ViewBuilder let leadingTitle: () -> OnUpdateButton
    @ViewBuilder let trailingTitle: () -> OnCancelButton
    
    let onTap: () -> Void
    let onCancel: () -> Void
    
    var body: some View {
        HStack(spacing: 12) {
            ActionButton(buttonTitle: leadingTitle) {
                onTap()
            }
            ActionButton(buttonTitle: trailingTitle) {
                onCancel()
            }
        }
    }
}


#Preview {
    ActionButtons {
        VStack{}
    } trailingTitle: {
        VStack{}
    } onTap: {
        //
    } onCancel: {
        //
    }
    .environmentObject(ScreensViewModel())
    .environmentObject(HomeViewModel())
    .environmentObject(UserViewModel())
    .environmentObject(NewAppointmentViewModel())
    .environmentObject(ToastViewModel())

}
