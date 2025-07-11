//
//  NewAppointmentViewModel.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 09/07/2025.
//

import Foundation
import Combine

class NewAppointmentViewModel: ObservableObject, NetworkManagerProtocol {
    
    @Published var isLoading: Bool = false
    @Published var categories: [CategoryFetchResponse] = []
    @Published var selectedCateory: CategoryFetchResponse? = nil
    
    init() {
        Task {
            guard let categories: [CategoryFetchResponse] = try? await requestCategories() else {
                print("Cannot get Data From URL FETCHCATEGORIES")
                return
            }
            self.categories = categories
        }
    }
    
    func requestCategories<T>() async throws -> T? where T : Decodable, T : Encodable {
        do {
            print("Starting to fetch All Categories...")
            self.isLoading = true

            guard let url = URL(string: "\(APIConfiguration.url)\(APIConfiguration.endpoints.fetchCategories)") else {
                print("URL Error")
                self.isLoading = false
                return [] as? T
            }

            let request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            let categories: [CategoryFetchResponse] = try JSONDecoder().decode([CategoryFetchResponse].self, from: data)
            
            print("Fetch All Categories Successfully...")
            print(categories)
            
            self.isLoading = false
            self.categories = categories
            
            return categories as? T
            
        } catch {
            print("Error Parsing Data: \(error.localizedDescription)")
            self.isLoading = false
            return [] as? T
        }
    }
}
