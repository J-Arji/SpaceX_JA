//
//  Navigation.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/20/24.
//

import Foundation
import UIKit

protocol NavigationProtocol: AnyObject {
    func push(_ vc: UIViewController)
    func presentModal(_ vc: UIViewController)

}

extension NavigationProtocol where Self: UIViewController {
    func push(_ vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func present(_ vc: UIViewController) {
        self.present(vc, animated: true)
    }
}
