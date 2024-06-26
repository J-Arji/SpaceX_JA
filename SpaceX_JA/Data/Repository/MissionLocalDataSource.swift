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
    //  MARK: - isExist
    ///
    /// - parameter key: id object
    /// - throws: DataTransferError
    /// - returns: Returns a LaunchEntity
    ///
    func isExist(key: String) async throws -> Bool
    
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
    
    func isExist(key: String) async throws -> Bool {
        try await RealmManager().getMissionr(forMission: key)
    }
    
    
    func save(object: LaunchEntity) async throws {
        try await RealmManager().saveMission(object: object)
    }
    
    func remove(key: String) async throws {
        try await RealmManager().deleteMission(id: ObjectId(string: key))
    }

}

