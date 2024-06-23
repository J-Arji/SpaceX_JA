//
//  RealmManager.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import Foundation
import RealmSwift

class RealmManager {
    static let shared = RealmManager()
    
    let version: UInt64 = 156
    private func insensitiveDataConfiguration() -> Realm.Configuration {
        var config = Realm.Configuration()
        config.schemaVersion = version
        config.migrationBlock = { migration, oldSchemaVersion in
        }
        return config
    }
    
    public func realm()  async throws  -> Realm {
        return try await Realm(configuration: insensitiveDataConfiguration())
    }
    
}

extension Realm {
  public func safeWrite(_ block: (() throws -> Void)) throws {
    if isInWriteTransaction {
      try block()
    } else {
      try write(block)
    }
  }
}
