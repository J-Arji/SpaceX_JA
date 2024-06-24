//
//  DataTransferError.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/20/24.
//

import Foundation
enum DataTransferError: Error {
    case decode(String)
    case invalidURL
    case noResponse
    case badRequest(Data)
    case unexpectedStatusCode(Int)
    case noNetworkConnectivity
    case forbidden
    case unknown(String)

}

extension DataTransferError {
    var description: String {
        switch self {
        case .noNetworkConnectivity: return "no network connectivity"
            
        case let .decode(detail): return detail
            
        case .badRequest: return "Bad Request"
            
        case .noResponse: return "The server not responding"
            
        case .invalidURL: return "Invalid URL"
            
        case let .unexpectedStatusCode(status):   return "Unexpected Status Code \(status) occured"
            
        case .forbidden: return "forbidden"

        case let .unknown(text): return text
            
        }
    }
}
