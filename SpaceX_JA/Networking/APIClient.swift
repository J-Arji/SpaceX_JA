//
//  APIClient.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/20/24.
//

import Foundation
protocol APIClient {
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T
}

class APIClientImp: APIClient {
    
    init() {
        
    }
    func request<T: Decodable>(_ endpoint: Endpoint) async throws -> T {
        guard let request = try? endpoint.asURLRequest()
        else { throw  HTTPError.invalidURL }
        
        let (data, responseTempo) = try await URLSession.shared.data(for: request, delegate: nil)
        guard let response = responseTempo as? HTTPURLResponse
        else { throw HTTPError.noResponse }
        
        switch response.statusCode {
        case 200..<300:
            return try await getResponse(type: T.self, data: data)
            
        case 400:
            throw HTTPError.badRequest(data)
            
        case 403:
            throw HTTPError.forbidden

        default:
            throw HTTPError.unexpectedStatusCode(response.statusCode)
        }
    }
    
    func getResponse<T: Decodable>(type: T.Type, data: Data) async throws -> T {
        do {
            let response = try JSONDecoder().decode(type.self, from: data)
            return response
        } catch {
            throw HTTPError.decode(error.localizedDescription)
        }
    }
}
    

