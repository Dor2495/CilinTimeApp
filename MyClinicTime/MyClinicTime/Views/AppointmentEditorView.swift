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
                        
                        dismiss()
                    }
                }
            }
            
            .navigationTitle("Edit Appointment")
        }
    }
}

#Preview {
    @Previewable @State var app = Appointment(date: Date(), title: "Test", price: 300.0)
    AppointmentEditorView(appointment: $app)
}
