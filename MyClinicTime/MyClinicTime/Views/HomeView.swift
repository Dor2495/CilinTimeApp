//
//  HomeView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

struct HomeView: View {
    @Environment(UserViewModel.self) var userviewModel: UserViewModel
    @Environment(AppointmentViewModel.self) var appointmentviewModel: AppointmentViewModel
    
    @State private var showCalendar: Bool = false
    @State private var date = Date.now
    @State private var selectedDate: Date? = nil

    
    var body: some View {
        NavigationView {
            
            VStack {
                CustomeCalendarView(date: $date, selectedDate: $selectedDate)
                
                // MARK: Add appointment to file
                Button("ADD") {
                    let AppointmentToAdd = Appointment(
                        id: UUID().uuidString, date: 123123,
                        title: "title",
                        price: 200
                    )
                    appointmentviewModel.allAppointments.append(AppointmentToAdd)
                    
                    let userToAdd = User(id: UUID().uuidString, firstName: "firstName", lastName: "lastName", email: "email@gmail.com", password: "123456", isLoggedIn: true, appointments: [AppointmentToAdd])
                    
                    userviewModel.allUsers.append(userToAdd)
                    
                    print(userviewModel.allUsers)
                    print(appointmentviewModel.allAppointments)
                }
                
                
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
    @Environment(AppointmentViewModel.self) var appointmentviewModel: AppointmentViewModel
    
    var selectedDate: Date?
    @State var appointmentsAtDay: [Appointment] = []
    
    var body: some View {
        
        var listToShow: [Appointment] {
            if selectedDate != nil {
                appointmentsAtDay
            } else {
                appointmentviewModel.allAppointments
            }
        }
        List {
            if listToShow.isEmpty {
                Text("No appointments found")
            }
            ForEach(listToShow) { appointment in
                AppointmentRowView(appointment: appointment)
            }
            .onDelete { indexSet in
                appointmentviewModel.allAppointments.remove(atOffsets: indexSet)
            }
        }
        .listStyle(.inset)
//        .onChange(of: selectedDate) { oldValue, newValue in
//            appointmentsAtDay = appointmentviewModel.allAppointments.filter {
//                $0.date.startOfDay == newValue?.startOfDay
//            }
//        }
    }
}

extension Date {
    func toDate(string: String, format: String = "yyyy-MM-dd") -> Date?  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone.current
        return dateFormatter.date(from: string)
    }
}

struct AppointmentRowView: View {
    var appointment: Appointment
    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading) {
                Text(appointment.title)
                    .font(.system(size: 18, weight: .medium, design: .serif))
                Text("\(appointment.date)")
            }
            Spacer()
            Text("\(appointment.price.formatted(.currency(code: "NIS")))")
        }
        .foregroundStyle(.black)
    }
}

#Preview {
    HomeView()
        .environment(UserViewModel())
        .environment(AppointmentViewModel())
}
