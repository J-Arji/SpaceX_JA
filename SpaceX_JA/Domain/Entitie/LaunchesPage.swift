//
//  LaunchesPage.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

// MARK: - LaunchesPage
struct LaunchesPage {
    let docs: [Launche]
    let totalDocs : Int?
    let totalPages : Int?
    let page : Int?
}

// MARK: - Extension LaunchesPage
extension LaunchesPage {
    
    /// Creates an instance of Launches struct with given LaunchesDTO
    init(_ dto: LaunchesDTO) {
        docs = dto.docs.map{ $0.toDomain() }
        totalDocs = dto.totalDocs
        totalPages = dto.totalPages
        page = dto.page
        
    }
}
