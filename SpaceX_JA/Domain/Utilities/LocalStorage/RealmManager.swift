//
//  RealmManager.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import Foundation
import RealmSwift

actor RealmManager {
    // An implicitly-unwrapped optional is used here to let us pass `self` to
    // `Realm(actor:)` within `init`
    var realm: Realm!
    init() async throws {
        realm = try await Realm(actor: self)
    }
    
    func saveMission(object: LaunchEntity) async throws {
        try await realm.asyncWrite {
            realm.add(object, update: .modified)
        }
    }
    
    func getMissionr(forMission id: String) -> Bool {
        if realm.objects(LaunchEntity.self).first(where: {$0.id.stringValue == id })  != nil{
            return true
        }
        return false
    }
    
    func deleteMission(id: ObjectId) async throws {
        try await realm.asyncWrite {
            if let todoToDelete = realm.object(ofType: LaunchEntity.self, forPrimaryKey: id) {
                realm.delete(todoToDelete)
            }
        }
    }
}
