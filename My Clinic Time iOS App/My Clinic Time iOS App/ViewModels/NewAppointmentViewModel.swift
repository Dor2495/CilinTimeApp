//
//  NewAppointmentViewModel.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 09/07/2025.
//

import Foundation
import Combine

class NewAppointmentViewModel: ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var categories: [CategoryFetchResponse] = []
    @Published var selectedCateory: CategoryFetchResponse? = nil
    
    init() {
        Task {
            await fetchCategories()
        }
    }
    
    func fetchCategories() async {
        print("Starting to fetch All Categories...")
        self.isLoading = true
        
        guard let url = URL(string: "http://localhost:3000/api/categories/") else {
            print("URL Error")
            self.isLoading = false
            return
        }
        
        let request = URLRequest(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let categories = try JSONDecoder().decode([CategoryFetchResponse].self, from: data)
            
            print("Fetch All Categories Successfully...")
            print(categories)
            
            self.isLoading = false
            self.categories = categories
            
        } catch {
            print("Error Parsing Data: \(error.localizedDescription)")
            self.isLoading = false
            return
        }
    }
}
