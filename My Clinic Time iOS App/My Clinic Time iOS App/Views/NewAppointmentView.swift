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
                                HStack(spacing: 20){
                                    AsyncImage(url: URL(string: cat.image_url ?? "")) { image in
                                        image.resizable()
                                            .frame(width: 70, height: 70)
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    Spacer()
                                    Text(cat.name)
                                }
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
            Task {
//                let _: [CategoryFetchResponse]? = try await storeVM.requestCategories()
                try await storeVM.requestCategories() as [CategoryFetchResponse]?
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
