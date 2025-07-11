//
//  HomeViewModel.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 07/07/2025.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var moveToHealthDeclaretion: Bool = false
    @Published var naviagteWaze: Bool = false
    @Published var sortBy: SortingBy = .date
    
    
}
