//
//  ServiceMissionInterface.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import Foundation
import Resolver

protocol MissionRemoteDataSource {
    func fetchList(input: LaunchInput) async throws -> LaunchesDTO
}

class MissionRemoteDataSourceImp: MissionRemoteDataSource {
    @Injected private var client: APIClient

    func fetchList(input: LaunchInput) async throws -> LaunchesDTO {
        let data = try await client.request(Router.list(input: input))
        return try data.decoded() as LaunchesDTO
    }
}


extension MissionRemoteDataSourceImp {
    enum Router: Endpoint {
        case list(input: LaunchInput)
        
        
        var path: String {
            switch self {
            case .list:
                return API.Path.query
            }
        }
        
        var method: Network.HTTPMethod {
            switch self {
            case .list:
                return .post
            }
        }
        
        var headers: [String : String]? {
            return ["Content-Type": Network.HTTPContentType.applicationJSON]
        }
        
        var body: [String : Any]? {
            switch self {
            case .list(let input):
                return try? input.asDictionary()
            }
        }
    }
}
