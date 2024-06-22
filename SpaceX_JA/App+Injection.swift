//
//  AppDelegate+Injection.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import Foundation
import Resolver

//MARK: - Extention Resolver
extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        registerMissionLayer()
    }
    
    //MARK: - register Mission List
    public static func registerMissionLayer() {
        register { APIClientImp() }.implements(APIClient.self)
        register { MissionListRepositoryImp()}.implements(MissionListRepository.self)
        register { ServiceMissionListImp() }.implements(ServiceMissionList.self)
        register { CacheMissionImp()}.implements(CacheMissionInterface.self)
    }
    
    
}
