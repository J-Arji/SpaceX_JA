//
//  UIView + StatefulView.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/24/24.
//

import Foundation
import UIKit

fileprivate enum AssociatedKeys {
  static var loadState = "jj.loadState"
  
}

extension UIView {
    
    /**
     Use this for showing activity indicator in view.
     
     To show the activity indicator use `startAnimating()` function and to hide it use `stopAnimating()`
     
     ## More Info:
     Check LoadState class documentation to get more information
     */
    public  var loadState: LoadState! {
        set {
            objc_setAssociatedObject(self,
                                     &AssociatedKeys.loadState,
                                     newValue ?? LoadState(in: self),
                                     .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get {
            guard let loadState = objc_getAssociatedObject(self, &AssociatedKeys.loadState) as? LoadState else {
                self.loadState = LoadState(in: self)
                return self.loadState
            }
            return loadState
        }
    }
}
