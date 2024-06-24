//
//  UIViewController + Present.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import UIKit
//MARK: - NavigationProtocol
protocol NavigationProtocol: AnyObject {
    func push(_ vc: UIViewController)
    func present(_ vc: UIViewController)
    func openURL(with path: String, completion: ((Bool) -> Void)?)
}


extension NavigationProtocol where Self: UIViewController {
    
    func push(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func present(_ vc: UIViewController) {
        self.present(vc, animated: true, completion: nil)
    }
    
    func openURL(with path: String, completion: ((Bool) -> Void)?) {
        guard let url = URL(string: path) else { return }
        UIApplication.shared.open(url, completionHandler: completion)
    }
    
}
