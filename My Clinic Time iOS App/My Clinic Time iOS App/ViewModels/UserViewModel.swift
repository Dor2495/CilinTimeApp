//
//  UserViewModel.swift
//  My Clinic Time iOS App
//
//  Created by Dor Mizrachi on 08/07/2025.
//

import Combine
import Foundation

/// `UserViewModel` is a view model class responsible for managing user-related data and interactions within the app.
/// 
/// This class handles the following responsibilities:
/// - Manages the state of the currently authenticated user, user appointments, and login session.
/// - Provides methods for authenticating the user, fetching user details, and retrieving the user's appointments from the backend.
/// - Maintains loading and authentication state, which can be observed by the user interface to manage updates and display loading indicators.
/// - Implements logout and refresh logic to clear user data or reload information as needed.
/// 
/// Key Published Properties:
/// - `user`: Stores the fetched user profile after authentication.
/// - `appointments`: Holds the user's list of scheduled appointments.
/// - `loginResponse`: Holds the most recent login operation's response.
/// - `isLoggedIn`: Indicates whether the user is currently authenticated.
/// - `isLoading`: Indicates if a request is in progress (e.g., login or fetch).
///
/// Usage:
/// - Use this view model with SwiftUI views (as an `ObservableObject`) to reflect and control user authentication, profile data,
///   and related loading states.

@MainActor
class UserViewModel: ObservableObject {
    @Published var user: UserFetchResponse? = nil
    @Published var appointments: [UserAppointmentFetchResponse] = []
    @Published var loginResponse: LoginResponse? = nil
    
    @Published var isLoggedIn: Bool = false
    @Published var isLoading: Bool = false
    
    func logout() {
        self.isLoggedIn = false
        self.user = nil
        self.loginResponse = nil
    }
    
    // func refresh()
    
    // MARK: HANDLE LOGIN ".../login" POST METHOD
    func login(_ email: String, _ password: String) async -> LoginResponse {
        print("Start login request for \(email)...")
        self.isLoading = true
        do {
            guard let url = URL(string: "http://server-ip-address/auth/login") else {
                self.isLoading = false
                print("Error URL")
                return LoginResponse(message: "Error URL")
            }
            
            var request = URLRequest(url: url)
            
            let loginRequest = LoginRequest(email: email, password: password)
            let encodedRequest = try JSONEncoder().encode(loginRequest)
            
            request.httpMethod = "POST"
            request.httpBody = encodedRequest
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            
            let (data, _) = try await URLSession.shared.data(for: request)
            let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
            
            guard let phone = loginResponse.phone else {
                print("Email or Password is Incorrect\n")
                self.isLoading = false
                return LoginResponse(message: "Error Login: Email or Password is Incorrect")
            }
            
            guard let fetchedUser = await fetchUser(phone) else {
                self.isLoading = false
                return LoginResponse(message: "Cannot fetch user after login with phone: \(phone)")
            }
            
            self.user = fetchedUser
            
            
            print("Response Message: \(loginResponse.message)\n")
            self.isLoading = false
            return loginResponse
            
        } catch {
            print("Error in Login: \(error.localizedDescription)\n")
            self.isLoading = false
            return LoginResponse(message: "Error Login: \(error.localizedDescription)")
        }
    }
    
    func fetchUser(_ phone: String) async -> UserFetchResponse? {
        print("Staring Fetch User Request for \(phone)...")
        self.isLoading = true
        
        guard let url = URL(string: "http://server-ip-address/customers/\(phone)") else {
            print("Error URL")
            self.isLoading = false
            return nil
        }
        let request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            print("DATA STRING: \(String(data: data, encoding: .utf8)!)\n")
            
            let fetchedUser = try JSONDecoder().decode(UserFetchResponse.self, from: data)
            print("Fetched User: \(fetchedUser)\n")
            self.isLoading = false
            return fetchedUser
            
        } catch {
            print("\(error)\n")
            self.isLoading = false
            return nil
        }
    }
    
    
    func fetchUserAppointments(_ phone: String) async -> [UserAppointmentFetchResponse] {
        print("Fetching user Appointments....\n")
        self.isLoading = true
        
        guard let url = URL(string: "http://server-ip-address/appointments/user-appointments/\(phone)") else {
            print("Error with URL\n")
            self.isLoading = false
            return []
        }
        let request = URLRequest(url: url)
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let fetchedAppointments = try JSONDecoder().decode([UserAppointmentFetchResponse].self, from: data)
            
            if fetchedAppointments != self.appointments {
                print("Fetched new Appointments: \n\(fetchedAppointments)")
            }
            self.isLoading = false
            return fetchedAppointments
        } catch {
            print("Error Fetching user appointments: \(error)")
            self.isLoading = false
            return []
        }
    }
    
    func refresh() async {
        guard let phone = self.user?.phone else {
            print("No Phone Found When Refreshing The List")
            return
        }
        let newAppointments = await self.fetchUserAppointments(phone)
        
        self.appointments = newAppointments
    }
}
