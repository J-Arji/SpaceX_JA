//
//  CrewDTO.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

// MARK: - CrewDTO
/// This object is part of DocsDTO
extension LaunchesDTO.DocsDTO {
    struct CrewDTO : Decodable {
        let crew : String?
        let role : String?
    }
    
}
