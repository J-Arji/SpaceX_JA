//
//  MissionDetailViewModel.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import Foundation
import Combine
import Resolver

class MissionDetailViewModel {
    //MARK: - properties
    @Injected private var service: MissionRepository
    
    private(set) var loadSubject = PassthroughSubject<Void, Never>()
    @Published private (set) var image: String?
    @Published private (set) var name: String?
    @Published private (set) var description: String?
    

    private var mission: Launche
    
    init(mission: Launche) {
        self.mission = mission
    }
    
    
    
}
