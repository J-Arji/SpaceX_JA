//
//  LoadState.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/24/24.
//

import Foundation
import UIKit

/**
 Activity indicator for any UIView.
 
 In most cases you will not use this class directly. This is how you will probably use:
 
 ```
 yourView.loadState.startAnimating()
 ```
 and
 ```
 yourView.loadState.stopAnimating()
 ```
 */
open class LoadState {
    
    // MARK: - public variables
    
    /// A boolean value determines whether activity indicator is hidden or not.
    public private(set) var isAnimating: Bool = false
    
    
    
    // MARK: - private variables
    
  
    private var indicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.style = .medium
        activity.color = .Design.Primary.indicator
        activity.hidesWhenStopped = true
        return activity
    }()
    
    private var buttonTitle: String?
    private var buttonImage: UIImage?
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        return imageView
    }()
    
    
    private var parent: UIView!
    
    private var verticalConstraint: NSLayoutConstraint!
    
    // MARK: - init
    
    /// - Parameter view: UITableView, UICollectionView or just any UIView that will be emptyState parent.
    init(in view: UIView, icon: UIImage? = nil) {
        parent = view
        view.addSubview(indicator)
        verticalConstraint = indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -view.safeAreaInsets.top / 2)
        verticalConstraint.isActive = true
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    
    // MARK: - public methods
    
    /// Animating activity indicator view
    public func startAnimating(verticalOffset: CGFloat = 0) {
//        if parent.emptyState.isVisible { parent.emptyState.hide() }
        isAnimating = true
        
        if let btn = parent as? UIButton {
            buttonTitle = btn.title(for: .normal)
            buttonImage = btn.image(for: .normal)
            btn.setImage(nil, for: .normal)
            btn.setTitle(nil, for: .normal)
            btn.isUserInteractionEnabled = false
        }
        indicator.startAnimating()
    
        if let view = parent as? UICollectionView {
            if let headerHeight = (view.collectionViewLayout as? UICollectionViewFlowLayout)?.headerReferenceSize.height {
                verticalConstraint.constant = headerHeight / 2 - view.safeAreaInsets.top / 2 + verticalOffset
            }
        } else { verticalConstraint.constant = verticalOffset }
    }
    
    /// Stop animating activity indicator view
    public func stopAnimating() {
      if isAnimating == false { return }
        NotificationCenter.default.removeObserver(self)
        DispatchQueue.main.async { [weak self] in
            self?.imageView.isHidden = true
            self?.isAnimating = false
            self?.indicator.stopAnimating()
            if let btn = self?.parent as? UIButton {
                btn.setImage(self?.buttonImage, for: .normal)
                btn.setTitle(self?.buttonTitle, for: .normal)
                btn.isUserInteractionEnabled = true
            }
        }
    }
    
    
    // MARK: - private methods
    
    @objc private func animateImageView() {
        let fullRotation = CABasicAnimation(keyPath: "transform.rotation")
        fullRotation.fromValue = NSNumber(floatLiteral: 0)
        fullRotation.toValue = NSNumber(floatLiteral: Double(CGFloat.pi * 2))
        fullRotation.duration = 0.5
        fullRotation.repeatCount = Float.greatestFiniteMagnitude
        imageView.layer.add(fullRotation, forKey: "360")
    }
    
}
