//
//  MyAppointmentsList.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 07/07/2025.
//


import SwiftUI

struct MyAppointmentsList<OnUpdateButton: View, OnCancelButton: View>: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var homeVM: HomeViewModel
//    @EnvironmentObject var storeVM: NewAppointmentViewModel ??
    
    @ViewBuilder var leadingTitle: () -> OnUpdateButton
    @ViewBuilder var trailingTitle: () -> OnCancelButton
    
    var sortedList: [UserAppointmentFetchResponse] {
        switch homeVM.sortBy {
        case .date:
            return userVM.appointments.sorted { $0.date > $1.date }
        case .status:
            return userVM.appointments.sorted { $0.status.rawValue < $1.status.rawValue }.reversed()
        }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 16) {
                ForEach(sortedList, id: \.id) { appointment in
                    AppointmentCard(
                        appointment: appointment,
                        leadingTitle: leadingTitle,
                        trailingTitle: trailingTitle)
                        {   // on update tapped
                            print("Tapped on Update \(appointment.treatmentName)")
                            
                        }   onCancel: {
                            print("Tapped on Cancel \(appointment.treatmentName)")
                        }
                }
            }
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    MyAppointmentsList(leadingTitle: {
        VStack {}
    }, trailingTitle: {
        VStack {}
    })
    .environmentObject(ScreensViewModel())
    .environmentObject(HomeViewModel())
    .environmentObject(UserViewModel())
    .environmentObject(NewAppointmentViewModel())
    .environmentObject(ToastViewModel())
}

