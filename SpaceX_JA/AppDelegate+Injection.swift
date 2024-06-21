//
//  AppDelegate+Injection.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import Foundation
import Resolver

//MARK: - Extention Resolver
extension Resolver {
    
    public static func registerAllServices() {
        registerMissionLayer()
    }
    
    //MARK: - register Mission List
    public static func registerMissionLayer() {
        register { MissionListRepository(cache: resolve(), service: resolve())}
        register { ServiceMissionListImp(client: APIClientImp()) }
        register { CacheMissionImp() }
    }
}
