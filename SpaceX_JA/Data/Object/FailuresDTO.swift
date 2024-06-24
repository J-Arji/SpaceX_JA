//
//  FailuresDTO.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

// MARK: - FailuresDTO
/// This object is part of DocsDTO
extension LaunchesDTO.DocsDTO {
    struct FailuresDTO : Decodable {
        let time : Int?
        let altitude : Int?
        let reason : String?
    }
}
