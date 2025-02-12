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
    
    @State var list: [Appointment] = [
        Appointment(id: UUID().uuidString, date: Date().randomDateWithinLastThreeMonths, title: "title 1", price: 100.0),
        Appointment(id: UUID().uuidString, date: Date().randomDateWithinLastThreeMonths, title: "title 2", price: 100.0),
        Appointment(id: UUID().uuidString, date: Date().randomDateWithinLastThreeMonths, title: "title 3", price: 100.0),
    ]
    
    @State var user: User?
        
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach($list, id: \.id) { $item in
                    HStack {
                        Text(item.title)
                        Spacer()
                        Button {
                            addAppointment(item)
                        } label: {
                            Image(systemName: "calendar.badge.plus")
                                .foregroundStyle(.primary)
                        }
                    }
                }
            }
        }
        .onAppear {
            user = userViewModel.allUsers.first(where: { $0.id == sessionManager.activeUser?.id })
        }
    }
    
    func addAppointment(_ appointment: Appointment) {
        let index = userViewModel.allUsers.firstIndex(of: user!)!
        userViewModel.allUsers[index].appointments.append(appointment)
    }
}

#Preview {
    @Previewable @StateObject var availableAppointmentsViewModel = AppointmentViewModel()
    AvailableAppointmentsView(user: UserViewModel().allUsers.first!)
        .environmentObject(UserViewModel())
        .environmentObject(SessionManager())
}
