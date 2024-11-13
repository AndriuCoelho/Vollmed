//
//  AuthenticationEndpoint.swift
//  Vollmed
//
//  Created by Ândriu F Coelho on 16/09/23.
//

import Foundation

enum AuthenticationEndpoint {
    case logout
}

extension AuthenticationEndpoint: Endpoint {
    var path: String {
        switch self {
        case .logout:
            return "/auth/logout"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .logout:
            return .post
        }
    }
    
    var header: [String : String]? {
        switch self {
        case .logout:
            guard let token = AuthenticationManager.shared.token else {
                print("Token não informado!")
                return nil
            }
            return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(token)"
            ]
        }
    }
    
    var body: [String : String]? {
        switch self {
        case .logout:
            return nil
        }
    }
}
