//
//  String + Localize.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/25/24.
//

import UIKit

//MARK: - Constant text
extension String {
    //MARK: - button
    static func buttons(_ button: ButtonText, _ variables: [CVarArg] = []) -> String {
        produceString(key: button.rawValue)
    }
    
    //MARK: - label
    static func labels(_ title: LabelText) -> String {
        produceString(key: title.rawValue)
    }

}

fileprivate func produceString(key: String) -> String {
    return  String(localized: String.LocalizationValue(key))
}
