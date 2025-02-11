//
//  SwiftUIView.swift
//  MyClinicTime
//
//  Created by Dor Mizrachi on 11/02/2025.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @EnvironmentObject var sessionManager: SessionManager
    
    
    var body: some View {
        NavigationStack {
            Text("\(sessionManager.activeUser?.isLoggedIn ?? false)")
            
            Button("SignOut") {
                sessionManager.logout()
                print("Signed Out Successfully")
            }
        }
    }
}

#Preview {
    @Previewable @State var userVeiwMode = UserViewModel()
    @Previewable @State var activeUser: User? = UserViewModel().allUsers.first!
    ProfileView()
        .environmentObject(userVeiwMode)
        .environmentObject(SessionManager())
}
