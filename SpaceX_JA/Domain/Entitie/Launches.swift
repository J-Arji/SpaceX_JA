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
    let name: String
    let dateUTC : Date?
    let success: Bool?
    let details : String?
    var wikipediaLink: String?
    
}

// MARK: - Extension Launche
extension Launche {
    
    /// Creates an instance of Launche struct with given DocsDTO
    init(_ dto: LaunchesDTO.DocsDTO) {
        id = dto.id
        name = dto.name ?? ""
        dateUTC = dto.staticFireDateUTC?.toDate
        success = dto.success
        details = dto.details
        wikipediaLink = dto.links?.wikipedia
    }
}
