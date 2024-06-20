//
//  HTTPMethod.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/20/24.
//

import Foundation

// method
enum Network {
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
        case patch = "PATCH"
    }

}

//Content type
extension Network {
    enum HTTPContentType {
        static let charsetUTF8 = "charset=utf-8"
        static let applicationJSON = "application/json"
        static let multipartFormData = "multipart/form-data"
    }
}

