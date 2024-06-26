//
//  UIimageView+kf.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import UIKit
import Kingfisher
import SwiftUI

protocol ImageLoaderProtocol: AnyObject {
    func setRemoteImage(with path: String?, placeholder: UIImage?)
}


extension UIImageView: ImageLoaderProtocol { }


extension ImageLoaderProtocol where Self: UIImageView {
    
    @MainActor func setRemoteImage(with path: String?, placeholder: UIImage? = nil) {

        // add activity indicator to image
        self.loadState.startAnimating()
        
        Task {
            do {
                let imageTempo = try await ImageLoader.shared.load(with: path)
                self.image =  imageTempo.preparingForDisplay()
                self.loadState.stopAnimating()
            } catch {
                self.image = placeholder
                self.loadState.stopAnimating()
            }
        }
        
    }
}
