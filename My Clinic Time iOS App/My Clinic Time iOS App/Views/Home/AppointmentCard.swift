//
//  AppointmentCard.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 07/07/2025.
//

import SwiftUI

struct AppointmentCard<OnUpdateButton: View, OnCancelButton: View>: View {
    let appointment: UserAppointmentFetchResponse
    
    @ViewBuilder let leadingTitle: () -> OnUpdateButton
    @ViewBuilder let trailingTitle: () -> OnCancelButton
    
    let onTap: () -> Void
    let onCancel: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: 0) {
            // Main content section
            VStack(alignment: .leading, spacing: 16) {
                // Header information
                VStack(alignment: .leading, spacing: 8) {
                    Text(appointment.treatmentName)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .accessibilityAddTraits(.isHeader)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "calendar")
                            .foregroundColor(.white.opacity(0.9))
                            .font(.caption)
                        Text("\(appointment.displayScheduledDate)")
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    
                    Text("Place Holder For A Message")
                        .font(.caption)
                        .foregroundColor(.white.opacity(0.8))
                        .fixedSize(horizontal: false, vertical: true)
                    
                }
                
                // Action buttons
                ActionButtons(
                    leadingTitle: leadingTitle,
                    trailingTitle: trailingTitle,
                    onTap: onTap,
                    onCancel: onCancel
                )
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Status indicator section
            StatusIndicator(status: appointment.status)
                .frame(width: 60)
                .padding(.trailing, 20)
        }
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(statusColor)
                .shadow(
                    color: .black.opacity(0.1),
                    radius: 8,
                    x: 0,
                    y: 4
                )
        )
    }
    
    private var statusColor: Color {
        switch appointment.status {
        case .confirmed:
            return Color.cardBgConfirmed
        case .pending:
            return Color.cardBgPending
        case .cancelled:
            return Color.cardBgCancelled
        case .completed:
            return Color.cardBgCompleted
        }
    }
}

#Preview {
    AppointmentCard(
        appointment: UserAppointmentFetchResponse(
            id: 1,
            treatmentName: "Massage",
            date: "Tomorrow, July 9th, 10:00 AM",
            beginTime: "10:00 AM",
            completeTime: "11:00 AM",
            fetchedStatus: "confirmed",
            arrivalConfirmation: 0,
            timeRange: "10:00 AM - 11:00 AM"
        ))
        { VStack {} }
        trailingTitle: { VStack {} }
        onTap: {}
        onCancel: {}
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
