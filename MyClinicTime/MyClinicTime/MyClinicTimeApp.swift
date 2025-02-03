//
//  MyClinicTimeApp.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

@main
struct MyClinicTimeApp: App {
    @State var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            if viewModel.user.isLoggedIn {
                MainTabView()
            } else {
                ContentView()
            }
        }
        .environment(viewModel)
    }
}
