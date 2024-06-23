//
//  MissionListRepositoryImp.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation
import Resolver
class MissionRepositoryImp: MissionListRepository {

    @Injected private var cache: MissionLocalDataSource
    @Injected private var remote: MissionRemoteDataSource

    func fetch(input: LaunchInput) async throws -> LaunchesPage {
        let data = try await remote.fetchList(input: input)
        return data.toDomain()
    }

}


extension MissionRepositoryImp: MissionRepository {
    
    func fetch(key: String) async throws -> Launche {
       let data = try await cache.fetch(key: key)
        return data.toDomain()
    }
    
    func save(object: Launche) async throws {
       try await cache.save(object: object.toEntitiy())
    }
    
    func remove(key: String) async throws {
        try await cache.remove(key: key)
    }
}
