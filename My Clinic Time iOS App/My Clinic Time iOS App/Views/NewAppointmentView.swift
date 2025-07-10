//
//  NewAppointmentView.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 06/07/2025.
//

import SwiftUI

struct NewAppointmentView: View {
    @EnvironmentObject var storeVM: NewAppointmentViewModel
    
    
    var body: some View {
        NavigationStack {
            GeometryReader { geo in
                if !storeVM.categories.isEmpty {
                    VStack {
                        List {
                            ForEach(storeVM.categories, id: \.name) { cat in
                                cat.body
                                    .onTapGesture {
                                        if storeVM.selectedCateory != cat {
                                            storeVM.selectedCateory = cat
                                        }
                                    }
                                    .frame(maxWidth: geo.size.width, maxHeight: geo.size.height * 0.9)

                            }
                        }
                    }
                } else {
                    ScrollView {
                        ContentUnavailableView(
                            "No Availabe Data ...",
                            systemImage: "personalhotspot.slash"
                        )
                    }
                }
            }
            
            .navigationTitle("New Appointment")
            .navigationSubtitle(storeVM.categories.isEmpty ? "Try Again Later Or Refresh" : "Select A Category")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    //
                }
            }
        }
        .refreshable {
            Task(priority: .userInitiated) {
                await storeVM.fetchCategories()
            }
        }
        
    }
}

#Preview {
    NewAppointmentView()
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
