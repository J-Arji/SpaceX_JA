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
    /// - throws: DataTransferError
    /// - returns: Data
    ///
    func request(_ endpoint: Endpoint) async throws -> Data
}

class APIClientImp: APIClient {
    var task: URLSession
    
    init(_ task: URLSession = URLSession.shared) {
        self.task = task
    }
    
    func request(_ endpoint: Endpoint) async throws -> Data {
        guard let request = try? endpoint.asURLRequest()
        else { throw  DataTransferError.invalidURL }
#if DEBUG
        print("👢", request.curlString)
#endif
        let (data, responseTempo) = try await task.data(for: request, delegate: nil)
        guard let response = responseTempo as? HTTPURLResponse
        else { throw DataTransferError.noResponse }
        
        switch response.statusCode {
        case 200..<300:
            return data
            
        case 400:
            throw DataTransferError.badRequest(data)
            
        case 403:
            throw DataTransferError.forbidden
            
        default:
            throw DataTransferError.unexpectedStatusCode(response.statusCode)
        }
    }
}


