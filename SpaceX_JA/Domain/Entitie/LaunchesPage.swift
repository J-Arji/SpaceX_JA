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
    let page : Int?
    let hasNextPage: Bool
    let nextPage: Int
}

// MARK: - Extension LaunchesPage
extension LaunchesPage {
    
    /// Creates an instance of Launches struct with given LaunchesDTO
    init(_ dto: LaunchesDTO) {
        docs = dto.docs.map{ $0.toDomain() }
        page = dto.page
        hasNextPage = dto.hasNextPage ?? false 
        nextPage = dto.nextPage ?? 1
    }
}

