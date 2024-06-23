//
//  Launches.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

//MARK: - Launche
struct Launche: Equatable, Identifiable {
    typealias Identifier = String
    let id: Identifier
    let name: String?
    let flightNumber: Int
    let dateUTC : Date?
    let success: Bool?
    let details : String?
    var wikipediaLink: String?
    var icon: String?
}

// MARK: - Extension Launche
extension Launche {
    
    /// Creates an instance of Launche struct with given DocsDTO
    init(_ dto: LaunchesDTO.DocsDTO) {
        id = dto.id
        name = dto.name
        flightNumber = dto.flightNumber
        dateUTC = dto.dateUTC?.toDate
        success = dto.success
        details = dto.details
        wikipediaLink = dto.links?.wikipedia
        icon = dto.links?.patch?.small
    }
}


// MARK: - Extension Launche
extension Launche {
    /// Creates an instance of Launche struct with given LaunchEntity
    init(_ entity: LaunchEntity) {
        id = entity.id.stringValue
        flightNumber = entity.flightNumber
        self.name = nil
        self.dateUTC = nil
        self.success = nil
        self.details = nil
        self.wikipediaLink = nil
        self.icon = nil
    }
}

extension Launche {
    func toEntitiy() -> LaunchEntity {
        LaunchEntity(self)
    }
}
