//
//  Date+Extension.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation

extension Date {
    var toString: String? {
        let formatter = DateFormatter()
        formatter.dateFormat =  "yyyy-MM-dd'T'HH:mm:ssZ"
        formatter.calendar = .current
        formatter.timeZone = .current
        formatter.dateStyle = .medium
        return formatter.string(from: self)
        
    }
}

