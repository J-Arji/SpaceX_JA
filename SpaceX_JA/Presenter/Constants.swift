//
//  Constants.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/25/24.
//

import Foundation

extension MissionListViewModel {
    enum Constants {
        enum Int {
            static let page = 1
            static let limit = 50
            static let defaultLimit = 20
            static let defaultNumberLine = 1
            static let descriptionNumberLine = 3
        }
        
        enum Size {
            static let cellTotalStackViewMargin = 16.0
            static let cellTotalStackViewHeight = 120.0
            static let cellStatusLabelHeight = 20.0
            static let cellIconImageViewHeight = 50.0
            static let cellDateLabelHeight = 15.0
            static let cellMultiplier = 1.0 
        }
        
    }
}
