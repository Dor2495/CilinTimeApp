//
//  HomeView.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 06/07/2025.
//

import SwiftUI
import Combine
import ToastUI

struct HomeView: View {
    @EnvironmentObject var homeVM: HomeViewModel
    @EnvironmentObject var userVM: UserViewModel
    
    var onToast: (Bool, ToastConfig) -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                SortSectionHeader(sortBy: $homeVM.sortBy)
                
                MyAppointmentsList {
                    Text("Update")
                } trailingTitle: {
                    Text("Cancel")
                }
            }
            .refreshable {
                Task(priority: .userInitiated) {
                    await userVM.refresh()
                }
            }
            .task {
                guard let phoneNumber = userVM.user?.phone else { return }
                userVM.appointments = await userVM.fetchUserAppointments(phoneNumber)
            }
            .padding()
            .navigationTitle("My Appointments")
            .navigationSubtitle("Last refreshed on `06/07/2025, 12:34`")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        NavigationLink {
                            Text("Health Declaretion")
                        } label: {
                            Label("Health Declaretion", systemImage: "heart.text.clipboard")
                                .symbolEffect(.appear)
                        }
                        
                        NavigationLink {
                            Text("Navigate Waze")
                        } label: {
                            Label("Waze", systemImage: "map")
                                .symbolEffect(.appear)
                        }
                            
                    } label: {
                        Image(systemName: "ellipsis")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView(onToast: { _, _ in })
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
