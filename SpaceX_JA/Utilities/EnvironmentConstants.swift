//
//  EnvironmentConstants.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

struct EnvironmentConstants: RawRepresentable {
   var rawValue: String
   var value: String {
      let v = ProcessInfo.processInfo.environment[rawValue]
      return v ?? ""
   }
}
