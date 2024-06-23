//
//  UIimageView+kf.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import UIKit
import Kingfisher
extension UIImageView {
    func setRemoteImage(with path: String?, placeholder: UIImage? = nil) {
        guard let path = path, let url = URL(string: path) else {
            return
        }
        setRemoteImage(url: url, placeholder: placeholder)
    }
    
    func setRemoteImage(url: URL?, placeholder: UIImage? = nil) {
      DispatchQueue.main.async {
        self.kf.setImage(with: url, placeholder: placeholder, options: [.transition(ImageTransition.fade(0.5)),
                                                                        .cacheMemoryOnly])
      }
    }
}
