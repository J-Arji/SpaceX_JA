//
//  MissionListRepositoryImp.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation
import Resolver
class MissionListRepositoryImp: MissionListRepository {

    @Injected private var cache: MissionLocalDataSource
    @Injected private var remote: MissionRemoteDataSource

    func fetch(input: LaunchInput) async throws -> LaunchesPage {
        let data = try await remote.fetchList(input: input)
        return data.toDomain()
    }

    
}
