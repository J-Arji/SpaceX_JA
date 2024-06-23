//
//  Sort.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

//MARK: - Sort
struct Sort: Codable {
    var flightNumber: Order = .desc

    enum CodingKeys: String, CodingKey {

        case flightNumber = "flight_number"
    }

}

enum Order: String, Codable {
    case desc, asc
}
