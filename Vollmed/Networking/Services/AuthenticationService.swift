//
//  AuthenticationService.swift
//  Vollmed
//
//  Created by Ândriu F Coelho on 16/09/23.
//

import Foundation

protocol AuthenticationServiceable {
    func logout() async -> Result<Bool?, RequestError>
}

struct AuthenticationService: HTTPClient, AuthenticationServiceable {
    func logout() async -> Result<Bool?, RequestError> {
        return await sendRequest(endpoint: AuthenticationEndpoint.logout, responseModel: nil)
    }
}





