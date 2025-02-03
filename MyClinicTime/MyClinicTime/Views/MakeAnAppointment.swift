//
//  MakeAnAppointment.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 30/01/2025.
//

import SwiftUI

struct MakeAnAppointment: View {
    @Environment(ViewModel.self) var viewModel
    
    @State var selectedAppointment: Appointment?
    @State private var showConfirmation: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.appointments) { appointment in
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
    MakeAnAppointment()
        .environment(ViewModel())
}
