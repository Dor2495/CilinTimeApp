//
//  NotificationViewModel.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 09/07/2025.
//

import Foundation
import Combine

class ToastViewModel: ObservableObject {
    @Published var showToast: Bool = false
}
