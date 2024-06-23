//
//  MissionListRepository.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation
 
// MARK: - MissionListRepository
/// This is repository model that it have to implement when we want  have fetch data or save model

protocol MissionListRepository {
    //  MARK: - fetch
    ///
    /// - parameter input: launch query input
    /// - throws: DataTransferError
    /// - returns: Returns a LaunchesPage Model
    ///
    func fetch(input: LaunchInput) async throws -> LaunchesPage
    
    //  MARK: - save
    ///
    /// - parameter value: object
    ///  - throws: DataTransferError
    /// - returns: Returns a persist data or not
    ///
    func fetch(key: String) async throws -> Launche
    
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
