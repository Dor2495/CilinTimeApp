//
//  ContentView.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 06/07/2025.
//

import SwiftUI
import ToastUI

struct ContentView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var toastVM: ToastViewModel
    
    @State private var toastConfig: ToastConfig? = nil
    
    var body: some View {
        VStack {
            Group {
                if userVM.isLoggedIn {
                    RootView() { show, config in
                        toastConfig = config
                        toastVM.showToast = show
                    }
                } else {
                    LoginView { show, config in
                        toastConfig = config
                        toastVM.showToast = show
                    }
                }
            }
        }
        .toast(
            isPresented: $toastVM.showToast,
            config: toastConfig ?? ToastConfig(title: "Toast Configuration Error")
        )
    }
}

#Preview {
    ContentView()
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
