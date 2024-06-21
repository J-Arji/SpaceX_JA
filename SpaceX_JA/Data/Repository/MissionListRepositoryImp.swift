//
//  MissionListRepositoryImp.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

class MissionListRepository: MissionListRepositoryInterface {

    private let cache: CacheMissionInterface
    private let service: ServiceMissionList
    
    init(cache: CacheMissionInterface, service: ServiceMissionList) {
        self.cache = cache
        self.service = service
    }
    
    func fetch(input: LaunchInput) async throws -> LaunchesPage {
        let data = try await service.fetchList(input: input)
        return data.toDomain()
    }

    
}
