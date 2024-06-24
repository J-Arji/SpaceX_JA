//
//  FairingsDTO.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

// MARK: - FairingsDTO
/// This object is part of DocsDTO
extension LaunchesDTO.DocsDTO {
    struct FairingsDTO: Decodable {
        let reused: Bool?
        let recoveryAttempt: Bool?
        let recovered: Bool?
        let ships: [String]?

        enum CodingKeys: String, CodingKey {
            case reused, recovered, ships
            case recoveryAttempt = "recovery_attempt"
        }

    }
}
