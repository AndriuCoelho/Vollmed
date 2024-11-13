//
//  HomeViewModel.swift
//  Vollmed
//
//  Created by Ândriu F Coelho on 10/09/23.
//

import SwiftUI

struct HomeViewModel {
    
    // MARK: - Attributes
    
    private let service: HomeServiceable
    private let authService: AuthenticationServiceable
    var authManager = AuthenticationManager.shared
    
    // MARK: - Initialize
    
    init(service: HomeServiceable, authService: AuthenticationServiceable) {
        self.service = service
        self.authService = authService
    }
    
    // MARK: - API calls
    
    func getSpecialists() async throws -> [Specialist]? {
        let result = try await service.getAllSpecialists()
        
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    func logout() async {
        let result = await authService.logout()
        
        switch result {
        case .success(_ ):
            authManager.removePatientID()
            authManager.removeToken()
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
