//
//  Config.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

struct Config {
    static let serverURL = EnvironmentVariables(rawValue: "SPACEX_SERVER_URL")
    static let versionURL = "V5"
}



struct EnvironmentVariables: RawRepresentable {
   var rawValue: String
   var value: String {
      let v = ProcessInfo.processInfo.environment[rawValue]
      return v ?? ""
   }
}
