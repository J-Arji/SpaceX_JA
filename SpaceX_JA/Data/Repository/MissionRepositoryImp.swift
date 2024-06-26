//
//  MissionListRepositoryImp.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation
import Factory

class MissionRepositoryImp: MissionListRepository {

    @Injected(\.MissionLocalDataService) private var cache
    @Injected(\.missionRemoteService) private var remote
    

    func fetch(input: LaunchInput) async throws -> LaunchesPage {
        let data = try await remote.fetchList(input: input)
        return data.toDomain()
    }

}


extension MissionRepositoryImp: MissionRepository {
    func isExist(key: String) async throws -> Bool {
        try await cache.isExist(key: key)
    }
    
    
    func save(object: Launche) async throws {
       try await cache.save(object: object.toEntitiy())
    }
    
    func remove(key: String) async throws {
        try await cache.remove(key: key)
    }
}

