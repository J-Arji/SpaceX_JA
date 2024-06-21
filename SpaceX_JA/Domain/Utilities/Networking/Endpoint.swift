//
//  Endpoint.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/20/24.
//

import Foundation

protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var method: Network.HTTPMethod { get }
    var headers: [String: String]? { get }
    var body: [String: Any]? { get }
}

extension Endpoint {
    var baseUrl: String { return SpacexApi.base.url }
    var headers: [String: String]? { nil }
    var body: [String: Any]? { nil }
}


extension Endpoint {
    // This `asURLRequest()` function is part of the `APIEndpoint` protocol extension in Swift. It is a
    // method that converts the endpoint information into a `URLRequest` object that can be used to
    // make network requests.
    public func asURLRequest() throws -> URLRequest {
        
        /// set the path and create the complete url
        guard let url = URL(string: baseUrl.appending(path)) else { throw HTTPError.invalidURL }

        var request = URLRequest(url: url)

        request.httpMethod = method.rawValue

        // set the header
        request.allHTTPHeaderFields = headers
        request.httpBody = body?.jsonData

        return request
    }
}
