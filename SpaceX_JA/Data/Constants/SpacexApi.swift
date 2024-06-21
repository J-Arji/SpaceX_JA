//
//  SpacexApi.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

// MARK: - SpacexApi
/// This enum use for  Appartement API constance
///
enum SpacexApi {
    case base
    case image
    
    var url: String {
        switch self {
        case .base: return baseUrl + versionURL
        case .image: return ""
        }
    }
    
    private var baseUrl: String {
        return EnvironmentConstants(rawValue: "SPACEX_SERVER_URL").value
    }

    private var versionURL: String {
        return "/V5"
    }

}


extension SpacexApi {
    enum Path {
        static let query = "launches/query"
    }
}
