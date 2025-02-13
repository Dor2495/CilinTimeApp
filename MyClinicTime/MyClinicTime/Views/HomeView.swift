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
    
    @State var user: User
    
    var body: some View {
        let list = user.appointments
        
        NavigationStack {
            VStack {
                List {
                    ForEach(list) { item in
                        HStack {
                            Text("\(item.title)")
                            Spacer()
                            Text("\(item.price.formatted()) $")
                        }
                        .bold()
                    }.onDelete(perform: delete)
                }
                
            }
            .onAppear {
                user = userViewModel.allUsers.first(where: {
                    $0.id == user.id
                })!
            }
            
            .navigationTitle("Home")
        }
    }
    
    func delete(at offset: IndexSet) {
        user.appointments.remove(atOffsets: offset)
        
        let index = userViewModel.allUsers.firstIndex(where: {
            $0.id == user.id
        })
        userViewModel.allUsers[index!] = user
    }
}

#Preview {
    HomeView(user: UserViewModel().allUsers.first!)
        .environmentObject(UserViewModel())
        .environmentObject(SessionManager())
}
