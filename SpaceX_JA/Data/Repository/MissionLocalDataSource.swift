//
//  MissionLocalDataSource.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import Foundation
import RealmSwift

// MARK: - MissionLocalDataSource
/// This is MissionLocalDataSource  that it have to implement when we want  have fetch, delete and save data 

protocol MissionLocalDataSource {
    //  MARK: - fetch
    ///
    /// - parameter key: id object
    /// - throws: DataTransferError
    /// - returns: Returns a LaunchEntity
    ///
    func fetch(key: String) async throws -> LaunchEntity
    
    //  MARK: - save
    ///
    /// - parameter object: The object to be added to the Realm.
    /// - throws: DataTransferError
    /// - returns: Only updates the properties of the existing object that have different
    ///
    func save(object: LaunchEntity) async throws
    
    //  MARK: - remove
    ///
    /// - parameter key: The key to be remove to the Realm.
    /// - throws: DataTransferError
    /// - returns: Only updates the properties of the existing object that have different
    ///
    func remove(key: String) async throws
}

class MissionLocalDataSourceImp: MissionLocalDataSource {
    func fetch(key: String) async throws -> LaunchEntity {
        let realm = try await RealmManager.shared.realm()
        guard let object = realm.object(ofType: LaunchEntity.self, forPrimaryKey: key) else {
            throw DataTransferError.unknown("")
        }
        return object
    }
    
    
    func save(object: LaunchEntity) async throws {
        let realm = try await Realm()
        try await realm.asyncWrite {
            realm.add(object, update: .modified)
        }
    }
    
    func remove(key: String) async throws {
        let realm = try await RealmManager.shared.realm()
        guard let object = realm.object(ofType: LaunchEntity.self, forPrimaryKey: key) else {
            throw DataTransferError.unknown("")
        }
        
        try await realm.asyncWrite {
            realm.delete(object)
        }
    }

}
