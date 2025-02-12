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
        var user: User! {
            if let userId = sessionManager.activeUser?.id {
                return userViewModel.allUsers.first { $0.id == userId }
            }
            return nil
        }
        
        VStack {
            List {
                ForEach(user!.appointments) { item in
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
