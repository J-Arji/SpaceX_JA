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
enum API {
    case base
    case image
    
    var url: String {
        switch self {
        case .base: return baseUrl + versionURL
        case .image: return ""
        }
    }
    
    private var baseUrl: String {
        return "https://api.spacexdata.com"
    }

    private var versionURL: String {
        return "/v5/"
    }

}


extension API {
    enum Path {
        static let query = "launches/query"
    }
}
