//
//  MakeAnAppointment.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 30/01/2025.
//

import SwiftUI

struct MakeAnAppointment: View {
    
    @State var futureAppointments: FakeFutureAppointments = .init()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("")
                    
                    // MARK: set list of available fake apoointments
                    
                } header: {
                    Text("Choose appointment type")
                }

            }
        }
    }
}

struct FakeFutureAppointments {
    
}

#Preview {
    MakeAnAppointment()
}
