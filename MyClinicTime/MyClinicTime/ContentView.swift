//
//  ContentView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var data: UserViewModel
    
    var body: some View {
        NavigationStack {
            LoginView()
        }
    }
}

#Preview {
    let user = User(firstName: "firdtname", lastName: "lastName", dateOfBirth: Date.now, email: "email@gmail.com", password: "password")
    ContentView()
        .environmentObject(UserViewModel(user: user))
}
