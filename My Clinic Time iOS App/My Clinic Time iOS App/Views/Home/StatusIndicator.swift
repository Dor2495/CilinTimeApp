//
//  StatusIndicator.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 07/07/2025.
//

import SwiftUI

struct StatusIndicator: View {
    let status: AppointmentStatus
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.clear)
                
                HStack(spacing: 12) {
                    statusIcon
                        .foregroundColor(.white)
                    
                    Text(status.displayName)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
                .rotationEffect(.degrees(-90))
                .frame(width: geometry.size.height, height: geometry.size.width)
                .offset(x: -geometry.size.width / 2)
            }
        }
        .accessibilityLabel("Status: \(status.displayName)")
    }
    
    @ViewBuilder
    private var statusIcon: some View {
        switch status {
        case .confirmed:
            Image(systemName: "checkmark.circle.fill")
        case .pending:
            Image(systemName: "clock.fill")
        case .cancelled:
            Image(systemName: "xmark.circle.fill")
        case .completed:
            Image(systemName: "checkmark.seal.fill")
        }
    }
}

#Preview {
    StatusIndicator(status: .cancelled)
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
