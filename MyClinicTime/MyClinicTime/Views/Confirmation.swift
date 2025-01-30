//
//  Confirmation.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 30/01/2025.
//

import SwiftUI

struct Confirmation: View {
    var appointment: Appointment
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 20) {
            Text("You have booked an appointment")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text(appointment.title)
                .font(.headline)
                .padding(.bottom, 5)
            
            Text("Date: \(User.dateFormatter().string(from: appointment.date))")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text("Price: $\(appointment.price, specifier: "%.2f")")
                .font(.subheadline)
                .foregroundColor(.blue)
            
            Spacer()
            
            Button(action: {
                // Action to confirm the appointment
                confirmAppointment()
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
    
    private func confirmAppointment() {
        // Logic to confirm the appointment
        print("Appointment confirmed for \(appointment.title) on \(User.dateFormatter().string(from: appointment.date))")
        // Dismiss the confirmation view after confirming
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    Confirmation(appointment: Appointment(date: User.dateFormatter().date(from: "2025.12.08")!, title: "Spa Treatment", price: 300))
}
