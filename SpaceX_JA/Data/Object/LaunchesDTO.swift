//
//  LaunchesDTO.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

// MARK: - LaunchesDTO
/// This is used in parsing objects from JSON file
struct LaunchesDTO: Decodable {
    let docs: [DocsDTO]
    let totalDocs : Int?
    let limit : Int?
    let totalPages : Int?
    let page : Int?
    let pagingCounter : Int?
    let hasPrevPage : Bool?
    let hasNextPage : Bool?
    let prevPage : Int?
    let nextPage : Int?
}

extension LaunchesDTO {
    func toDomain() {
        
    }
}
