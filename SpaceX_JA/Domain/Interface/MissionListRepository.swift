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
    /// - throws: HTTPError
    /// - returns: Returns a LaunchesPage Model
    ///
    func fetch(input: LaunchInput) async throws -> LaunchesPage
    
    //  MARK: - save
    ///
    /// - parameter value: object
    ///  - throws: HTTPError
    /// - returns: Returns a persist data or not
    ///
//    func save(value: Launche) async throws -> Bool
//    
//    //  MARK: - isExist
//    ///
//    /// - parameter key: string Id of object
//    ///  - throws: HTTPError
//    /// - returns: Returns a Launche Model
//    ///
//    func isExist(key: String) async throws -> Launche
//    
//    
//    //  MARK: - remove
//    ///
//    /// - parameter key: string Id of object
//    ///  - throws: HTTPError
//    /// - returns: Returns  delete object from database or not
//    ///
//    func remove(key: String) async throws -> Bool
}
