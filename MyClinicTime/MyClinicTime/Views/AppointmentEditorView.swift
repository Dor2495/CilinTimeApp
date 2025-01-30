//
//  EditAppointment.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

import SwiftUI

struct AppointmentEditorView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var data: UserViewModel
    
    @Binding var appointment: Appointment

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Details")) {
                    TextField("Title", text: $appointment.title)
                    DatePicker("Date", selection: $appointment.date, displayedComponents: .date)
                    TextField("Price", value: $appointment.price, formatter: NumberFormatter())
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        //MARK: save changes
                        saveChanges(of: appointment)
                        dismiss()
                    }
                }
            }
            
            .navigationTitle("Edit Appointment")
        }
    }
    
    private func saveChanges(of newAppointment: Appointment) {
        let appointmentToUpdate = data.activeUser.appointments.first(where: { $0.id == newAppointment.id })!
        
        data.activeUser.appointments[data.activeUser.appointments.firstIndex(of: appointmentToUpdate)!] = appointmentToUpdate
    }
}

#Preview {
    @Previewable @State var app = Appointment(date: Date(), title: "Test", price: 300.0)
    AppointmentEditorView(appointment: $app)
}
