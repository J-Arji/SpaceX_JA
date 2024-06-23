//
//  Data+Decode.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import Foundation
protocol AnyDecoder {
  func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T
}

extension JSONDecoder: AnyDecoder {}

extension Data {
  func decoded<T: Decodable>(using decoder: AnyDecoder = JSONDecoder()) throws -> T {
    return try decoder.decode(T.self, from: self)
  }
}
