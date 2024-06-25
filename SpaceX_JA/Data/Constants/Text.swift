//
//  Text.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/25/24.
//

import Foundation


/// All `UIButton` and `UIBarButtonItem` titles
enum ButtonText: String {
    case retry = "btn_retry"
    case cancel = "btn_cancel"
}


enum LabelText: String {
    
    // MARK: - Global
    case success = "lbl_success"
    case faild = "lbl_Faild"
    case alert = "lbl_alert"
    
    // MARK: - detail
    case number = "lbl_number"
}


enum ImageText {
    enum placeholder: String {
        case cell = "placeholder"
    }
}
