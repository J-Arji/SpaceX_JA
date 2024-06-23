//
//  CoresDTO.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

// MARK: - CoresDTO
/// This object is part of DocsDTO
extension LaunchesDTO.DocsDTO {
    struct CoresDTO : Decodable {
        let core : String?
        let flight : Int?
        let gridfins : Bool?
        let legs : Bool?
        let reused : Bool?
        let landingAttempt : Bool?
        let landingSuccess : Bool?
        let landingType : String?
        let landpad : String?
        
        enum CodingKeys: String, CodingKey {
            
            case core, flight, gridfins, legs, reused, landpad
            case landingAttempt = "landing_attempt"
            case landingSuccess = "landing_success"
            case landingType = "landing_type"
        }
    }
}
