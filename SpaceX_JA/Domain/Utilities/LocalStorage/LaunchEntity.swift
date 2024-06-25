//
//  LaunchEntity.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import Foundation
import RealmSwift
class LaunchEntity: Object {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var flightNumber: Int
}

extension LaunchEntity {
    convenience init(_ object: Launche) {
        self.init()
        self.id = try! ObjectId(string: object.id)
        self.flightNumber = object.flightNumber
    }
}

extension LaunchEntity {
    func toDomain() -> Launche {
        return Launche(self)
    }
}
