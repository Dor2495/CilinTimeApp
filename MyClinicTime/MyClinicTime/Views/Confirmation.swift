//
//  Confirmation.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 30/01/2025.
//

import SwiftUI

struct Confirmation: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(AppointmentViewModel.self) var appointmentviewModel
    
    var appointment: Appointment
    
    var body: some View {
        VStack(spacing: 20) {
            Text("You have booked an appointment")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text(appointment.title)
                .font(.headline)
                .padding(.bottom, 5)
            
//            Text("Date: \(appointment.date)")
//                .font(.subheadline)
//                .foregroundColor(.gray)
            
            Text("Price: $\(appointment.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.blue)
            
            Spacer()
            
            Button(action: {
                // MARK: - confirm appointment
                
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Confirm Booking")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            
            Button(action: {
                // Dismiss the confirmation view
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        }
        .padding()
        .navigationTitle("Confirmation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    Confirmation(appointment: AppointmentViewModel().allAppointments[0])
        .environment(UserViewModel())
        .environment(AppointmentViewModel())
        
}
