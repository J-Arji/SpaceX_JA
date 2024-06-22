//
//  String+Extension.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation
extension String {
    var toDate: Date? {
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return dateFormatter.date(from: self)
    }
}
