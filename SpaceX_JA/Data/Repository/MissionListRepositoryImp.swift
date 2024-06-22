//
//  MissionListRepositoryImp.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

class MissionListRepository: MissionListRepositoryInterface {

    private let cache: CacheMissionInterface
    private let remote: ServiceMissionList
    
    init(cache: CacheMissionInterface, remote: ServiceMissionList) {
        self.cache = cache
        self.remote = remote
    }
    
    func fetch(input: LaunchInput) async throws -> LaunchesPage {
        let data = try await remote.fetchList(input: input)
        return data.toDomain()
    }

    
}
