//
//  HomeView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var data: UserViewModel
    
    @State private var showCalendar: Bool = false
    @State private var date = Date.now
    @State private var selectedDate: Date? = nil

    
    var body: some View {
        NavigationView {
            
            VStack {
                CustomeCalendarView(date: $date, selectedDate: $selectedDate)
                
                ListView(selectedDate: selectedDate)
                .padding()
                
                Spacer()
            }
            .navigationTitle("My Appointments")
        }
        .ignoresSafeArea()
    }
}

struct ListView: View {
    @EnvironmentObject var data: UserViewModel
    
    var selectedDate: Date?
    @State var appointmentsAtDay: [Appointment] = []
    
    var body: some View {
        
        var listToShow: [Appointment] {
            if selectedDate != nil {
                appointmentsAtDay
            } else {
                data.activeUser!.appointments
            }
        }
        List {
            if listToShow.isEmpty {
                Text("No appointments found")
            }
            ForEach(listToShow) { appointment in
                AppointmentRowView(appointment: appointment)
            }
        }
        .listStyle(.inset)
        .onChange(of: selectedDate) { oldValue, newValue in
            appointmentsAtDay = data.activeUser?.appointments.filter {
                $0.date.startOfDay == newValue?.startOfDay
            } ?? []
        }
    }
}

struct AppointmentRowView: View {
    var appointment: Appointment
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(appointment.title)
                    .font(.system(size: 18, weight: .medium, design: .serif))
                Text(appointment.date.formatted())
                    .font(.system(size: 14, weight: .regular, design: .serif))
            }
            Spacer()
            Text("\(appointment.price.formatted(.currency(code: "NIS")))")
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    let user = User(firstName: "firstname", lastName: "lastName", dateOfBirth: Date.now, email: "email@gmail.com", password: "password")
    HomeView()
        .environmentObject(UserViewModel(user: user))
}
