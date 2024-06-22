//
//  MissionListRepositoryImp.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation
import Resolver
class MissionListRepositoryImp: MissionListRepository {

    @Injected private var cache: CacheMissionInterface
    @Injected private var remote: ServiceMissionList

    func fetch(input: LaunchInput) async throws -> LaunchesPage {
        let data = try await remote.fetchList(input: input)
        return data.toDomain()
    }

    
}
