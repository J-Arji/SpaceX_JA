//
//  AppDelegate+Injection.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import Foundation
import Factory

//MARK: - Extention Container
extension Container {
    //MARK: - Service
    
    var networkService: Factory<APIClient> {
        Factory(self) { APIClientImp() }
    }
   
    var missionRemoteService: Factory<MissionRemoteDataSource> {
        Factory(self) { MissionRemoteDataSourceImp() }
    }
    
    var MissionLocalDataService: Factory<MissionLocalDataSource> {
        Factory(self) { MissionLocalDataSourceImp() }
    }
    
    
    //MARK: - Repository
    var missionlistRepository: Factory<MissionListRepository> {
        Factory(self) { MissionRepositoryImp() }
    }
    
    var missionDetailReposiotry: Factory<MissionRepository> {
        Factory(self) { MissionRepositoryImp() }
    }
    
}
