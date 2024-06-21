//
//  DocsDTO.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

// MARK: - Docs
/// This object is part of LaunchesDTO
extension LaunchesDTO {
    struct DocsDTO : Decodable {
        let fairings : FairingsDTO?
        let links : LinksDTO?
        let staticFireDateUTC : String?
        let staticFireDateUnix : Int?
        let net : Bool?
        let window : Int?
        let rocket : String?
        let success : Bool?
        let failures : [FailuresDTO]?
        let details : String?
        let crew : [CrewDTO]?
        let ships : [String]?
        let capsules : [String]?
        let payloads : [String]?
        let launchpad : String?
        let flightNumber : Int?
        let name : String?
        let dateUTC : String?
        let dateUnix : Int?
        let dateLocal : String?
        let datePrecision : String?
        let upcoming : Bool?
        let cores : [CoresDTO]?
        let autoUpdate : Bool?
        let tbd : Bool?
        let launchLibraryId : String?
        let id : String?

        enum CodingKeys: String, CodingKey {
            case id, tbd
            case staticFireDateUTC = "static_fire_date_utc"
            case staticFireDateUnix = "static_fire_date_unix"
            case net, fairings, links, window, rocket, success, failures, details, crew
            case ships, name, capsules, payloads, launchpad, upcoming, cores
            case flightNumber = "flight_number"
            case dateUTC = "date_utc"
            case dateUnix = "date_unix"
            case dateLocal = "date_local"
            case datePrecision = "date_precision"
            case autoUpdate = "auto_update"
            case launchLibraryId = "launch_library_id"

        }

    }
}
