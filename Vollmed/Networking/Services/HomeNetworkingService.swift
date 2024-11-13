//
//  HomeNetworkingService.swift
//  Vollmed
//
//  Created by Ândriu F Coelho on 16/09/23.
//

import Foundation

protocol HomeServiceable {
    func getAllSpecialists() async throws -> Result<[Specialist]?, RequestError>
}

struct HomeNetworkingService: HTTPClient, HomeServiceable {
    func getAllSpecialists() async throws -> Result<[Specialist]?, RequestError> {
        return await sendRequest(endpoint: HomeEndpoint.getAllSpecialists, responseModel: [Specialist].self)
    }
}
