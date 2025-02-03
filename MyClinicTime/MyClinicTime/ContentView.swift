//
//  ContentView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 26/01/2025.
//

import SwiftUI

struct ContentView: View {
    @Environment(ViewModel.self) var viewModel
    
    var body: some View {
        NavigationStack {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
        .environment(ViewModel())
}
