//
//  Dictionary+Extension.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/20/24.
//

import Foundation

extension Dictionary {

    var jsonData: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
    }

    func toJSONString() -> String? {
        if let jsonData = jsonData {
            let jsonString = String(data: jsonData, encoding: .utf8)
            return jsonString
        }
        return nil
    }
}
