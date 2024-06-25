//
//  UIColor + Design.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/25/24.
//

import UIKit

extension UIColor {
    struct Design {
        enum Primary {
            static let background = UIColor.white
            static let indicator = UIColor.gray
            static let buttonTint = UIColor.systemBlue
            static let success = UIColor.systemGreen
            static let faild = UIColor.systemRed
        }
        
        enum Secondary {
            static let background = UIColor.systemBackground
        }
        
        enum Grayscale {
            static let background = UIColor.black
        }
    }
}
