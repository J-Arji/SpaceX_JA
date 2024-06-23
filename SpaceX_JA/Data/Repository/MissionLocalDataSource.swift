//
//  MissionLocalDataSource.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/22/24.
//

import Foundation

protocol MissionLocalDataSource {
    func fetch(key: String)
    func save(key: String)
}

class MissionLocalDataSourceImp: MissionLocalDataSource {
    func fetch(key: String) {
        //TODO: fetch data
    }
    
    func save(key: String) {
        //TODO: save Data
    }
    

}
