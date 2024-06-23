//
//  AppFlowDelegate.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import UIKit

enum AppFlow {
    case main
    case splash
    var viewController: UIViewController {
        switch self {
        case .splash: return SplashView()
        case .main: return UINavigationController(rootViewController: MissionListView())
        }
    }
}

//MARK: - changeFlow
/// `AppFlowDelegate` make change flow app

protocol AppFlowDelegate {
    func changeFlow(to flow: AppFlow)
}

extension AppFlowDelegate where Self: SceneDelegate {
    
    private var transition: CATransition {
        let transition = CATransition()
        transition.type =  .reveal
        transition.duration = 0.5
        return transition
    }
    
    func changeFlow(to flow: AppFlow) {
        window?.rootViewController = nil
        window?.layer.add(transition, forKey: kCATransition)
        window!.rootViewController = flow.viewController
        window?.makeKeyAndVisible()
        
    }
    
//
}
extension SceneDelegate: AppFlowDelegate {}
