//
//  AvailableAppointmentsView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 11/02/2025.
//

import SwiftUI

struct AvailableAppointmentsView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var sessionManager: SessionManager
    
    @StateObject var availableAppointmentsViewModel = AppointmentViewModel()
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($availableAppointmentsViewModel.allAppointments, id: \.id) { $item in
                    HStack {
                        Text(item.title)
                        Spacer()
                        Button {
                            sessionManager.activeUser?.appointments.append(item)
                            userViewModel.save()
                        } label: {
                            Image(systemName: "calendar.badge.plus")
                                .foregroundStyle(.primary)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @StateObject var availableAppointmentsViewModel = AppointmentViewModel()
    AvailableAppointmentsView()
        .environmentObject(UserViewModel())
        .environmentObject(SessionManager())
}
