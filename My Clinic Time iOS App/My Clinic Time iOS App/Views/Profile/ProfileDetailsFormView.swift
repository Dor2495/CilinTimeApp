//
//  ProfileDetailsFormView.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 09/07/2025.
//

import SwiftUI

struct ProfileDetailsFormView: View {
    let user: UserFetchResponse
    
    var body: some View {
        Text("\(user.firstName)")
        Text("\(user.lastName)")
        Text("\(user.email)")
        Text("\(user.phone)")
        Text("\(user.address)")
        Text("\(user.birthday)")
    }
}

#Preview {
    ProfileDetailsFormView(
        user: UserFetchResponse(
            firstName: "",
            lastName: "",
            email: "",
            phone: "",
            address: "",
            birthday: "",
            isProfileComplete: false,
            isHealthDeclarationReviewRequired: false,
            token: ""
        )
    )
        .environmentObject(ScreensViewModel())
        .environmentObject(HomeViewModel())
        .environmentObject(UserViewModel())
        .environmentObject(NewAppointmentViewModel())
        .environmentObject(ToastViewModel())
}
