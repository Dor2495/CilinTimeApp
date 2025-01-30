//
//  MakeAnAppointment.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 30/01/2025.
//

import SwiftUI

struct MakeAnAppointment: View {
    @EnvironmentObject var data: UserViewModel
    @State var selectedAppointment: Appointment?
    @State private var showConfirmation: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.availableAppointment) { appointment in
                    AppointmentRow(appointment: appointment)
                        .onTapGesture {
                            selectedAppointment = appointment
                            print(appointment)
                        }
                        .background(selectedAppointment == appointment ? .gray.opacity(0.2) : Color.clear)
                }
            }
            .toolbar {
                if selectedAppointment != nil {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Next") {
                            showConfirmation = true
                        }
                    }
                }
            }
            
            .navigationTitle("New Appointment")
        }
        .onAppear {
            selectedAppointment = nil
        }
        .sheet(isPresented: $showConfirmation) {
            Confirmation(appointment: selectedAppointment!)
                .presentationDetents([.medium])
        }
    }
}

struct AppointmentRow: View {
    var appointment: Appointment
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(appointment.title)
                    .font(.headline)
                Text(appointment.date.formatted(date: .long, time: .omitted))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("$\(appointment.price, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.blue)
        }
        .padding()
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    let user = User(firstName: "firstname", lastName: "lastName", dateOfBirth: Date.now, email: "email@gmail.com", password: "password")
    MakeAnAppointment()
        .environmentObject(UserViewModel(user: user))
}

#Preview{
    AppointmentRow(appointment: Appointment(date: User.dateFormatter().date(from: "2025.12.08")!, title: "Spa Treatment", price: 300))
}
