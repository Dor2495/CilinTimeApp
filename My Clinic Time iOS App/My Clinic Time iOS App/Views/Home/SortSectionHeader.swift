//
//  SortSectionHeader.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 07/07/2025.
//

import SwiftUI

struct SortSectionHeader: View {
    @Binding var sortBy: SortingBy
    
    var body: some View {
        Picker(selection: $sortBy) {
            ForEach(SortingBy.allCases, id: \.rawValue) { option in
                Text(option.displayName)
                    .font(.caption)
                    .tag(option)
            }
        } label: {
            Image(systemName: "arrow.up.arrow.down")
        }
        .pickerStyle(.palette)
    }
}

#Preview {
    SortSectionHeader(sortBy: .constant(.date))
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
