//
//  UIImage  + Design.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/25/24.
//

import UIKit

extension UIImage {
    struct Design {
        enum placeholderApp {
            static let cell = UIImage.placeholder
            static let view = UIImage.placeholder
        }
        
        enum Button {
            static let selected = UIImage(systemName: ImageText.ButtonText.selectedMark.rawValue)
            static let unselected = UIImage(systemName: ImageText.ButtonText.unselectedMark.rawValue)
            static let info = UIImage(systemName: ImageText.ButtonText.info.rawValue)
        }
    }
}
