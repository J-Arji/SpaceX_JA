//
//  LuanchInput.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

//MARK: - LuanchInput
struct LaunchInput: Encodable {
    let query: Query
    let options: Option
}

//MARK: - initializer
extension LaunchInput {
    init(upcoming: Bool = false, limit: Int, page: Int, sort: Sort = Sort(flightNumber: .desc)) {
        self.query = Query(upcoming: upcoming)
        self.options = Option(limit: limit, page: page, sort: sort)
    }
}

//MARK: - Query
extension LaunchInput {
    struct Query: Encodable {
        var upcoming: Bool = false
    }
}

//MARK: - Option
extension LaunchInput {
    struct Option: Codable {
        var limit: Int
        let page: Int
        let sort: Sort
    }
}
