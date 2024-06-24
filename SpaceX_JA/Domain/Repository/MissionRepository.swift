//
//  MissionRepository.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import Foundation

// MARK: - MissionRepository
/// This is repository model that it have to implement when we want  have fetch data or save model
protocol MissionRepository {
    
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
    func save(object: Launche) async throws

    //  MARK: - remove
    ///
    /// - parameter key: The key to be remove to the Realm.
    /// - throws: DataTransferError
    /// - returns: Only updates the properties of the existing object that have different
    ///
    func remove(key: String) async throws

}



