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
    @Environment(AppointmentViewModel.self) var appointmentviewModel
    
    
    @Binding var appointment: Appointment

    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $appointment.title)
//                    DatePicker("Date", selection: $appointment.date, displayedComponents: .date)
                    TextField("Price", value: $appointment.price, formatter: NumberFormatter())
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Save") {
                        //MARK: save changes
                        
                        dismiss()
                    }
                }
            }
            
            .navigationTitle("Edit Appointment")
        }
    }
}

#Preview {
    @Previewable @State var appointment = AppointmentViewModel().allAppointments[0]
    AppointmentEditorView(appointment: $appointment)
        .environment(AppointmentViewModel())
}
