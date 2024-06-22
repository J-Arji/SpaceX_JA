//
//  GradientView.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import Foundation
import UIKit

//MARK: - GradientView
class GradientView: UIView {
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureGradientLayer()
    }
    
    func configureGradientLayer(){
        backgroundColor = .clear
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradient.locations = [0, 1]
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}
