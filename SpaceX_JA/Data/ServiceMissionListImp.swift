//
//  ServiceMissionInterface.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import Foundation
protocol ServiceMissionList {
    func fetchList(input: LaunchInput) async throws -> LaunchesDTO
}

class ServiceMissionListImp: ServiceMissionList {
    private let client: APIClient
    init(client: APIClient) {
        self.client = client
    }
    

    func fetchList(input: LaunchInput) async throws -> LaunchesDTO {
        let data = try await client.request(Router.list(input: input))
        return try JSONDecoder().decode(LaunchesDTO.self, from: data)
    }
}


extension ServiceMissionListImp {
    enum Router: Endpoint {
        case list(input: LaunchInput)
        
        
        var path: String {
            switch self {
            case .list:
                return SpacexApi.Path.query
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
