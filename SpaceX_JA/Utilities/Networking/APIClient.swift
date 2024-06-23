//
//  APIClient.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/20/24.
//

import Foundation
// MARK: - APIClient
/// This is network  layer  that it have to implement when we want  have fetch data from backend
protocol APIClient {
    //  MARK: - fetch
    ///
    /// - parameter endpoint: recive router and other config
    /// - throws: HTTPError
    /// - returns: Data
    ///
    func request(_ endpoint: Endpoint) async throws -> Data
}

class APIClientImp: APIClient {
    
    func request(_ endpoint: Endpoint) async throws -> Data {
        guard let request = try? endpoint.asURLRequest()
        else { throw  HTTPError.invalidURL }
#if DEBUG
        print("👢", request.curlString)
#endif
        let (data, responseTempo) = try await URLSession.shared.data(for: request, delegate: nil)
        guard let response = responseTempo as? HTTPURLResponse
        else { throw HTTPError.noResponse }
        
        switch response.statusCode {
        case 200..<300:
            return data
            
        case 400:
            throw HTTPError.badRequest(data)
            
        case 403:
            throw HTTPError.forbidden
            
        default:
            throw HTTPError.unexpectedStatusCode(response.statusCode)
        }
    }
}


