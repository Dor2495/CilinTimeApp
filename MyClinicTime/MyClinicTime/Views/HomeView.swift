//
//  HomeView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 11/02/2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var sessionManager: SessionManager
    
    
    var body: some View {
        VStack {
            List {
                ForEach(sessionManager.activeUser?.appointments ?? [
                    Appointment(id: UUID().uuidString, date: Date().randomDateWithinLastThreeMonths, title: "title", price: 300.0)
                ]) { item in
                    HStack {
                        Text("\(item.title)")
                        Spacer()
                        Text("\(item.price.formatted()) $")
                    }
                    .bold()
                }
            }
            .navigationTitle("Home")
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(UserViewModel())
        .environmentObject(SessionManager())
}
