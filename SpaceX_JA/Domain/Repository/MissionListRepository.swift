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

}
