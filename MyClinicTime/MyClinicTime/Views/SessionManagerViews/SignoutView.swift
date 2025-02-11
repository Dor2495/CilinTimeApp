//
//  SwiftUIView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 11/02/2025.
//

import SwiftUI

struct SignOutView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Binding var activeUser: User?
    
    
    var body: some View {
        NavigationStack {
            Text("\(userViewModel.allUsers.first!.isLoggedIn)")
            
            Button("SignOut") {
                activeUser!.isLoggedIn.toggle()
                activeUser = nil
                print("Signed Out Successfully")
            }
        }
    }
}

#Preview {
    @Previewable @State var userVeiwMode = UserViewModel()
    @Previewable @State var activeUser: User? = UserViewModel().allUsers.first!
    SignOutView(activeUser: $activeUser)
        .environmentObject(userVeiwMode)
}
