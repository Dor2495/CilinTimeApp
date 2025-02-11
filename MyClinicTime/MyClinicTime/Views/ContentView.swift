//
//  ContentView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var userVeiwMode = UserViewModel()
    @State var activeUser: User? = nil
    
    var body: some View {
        NavigationStack {
            
            if activeUser != nil {
                if activeUser!.isLoggedIn {
                    SignOutView(activeUser: $activeUser)
                        .environmentObject(userVeiwMode)
                }
            } else {
                LogInView(activeUser: $activeUser)
                    .environmentObject(userVeiwMode)
            }
        }
    }
}

#Preview {
    ContentView()
}
