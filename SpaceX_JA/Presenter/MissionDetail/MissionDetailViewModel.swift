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
    
    private var cancellables = Set<AnyCancellable>()
    private var mission: Launche

    @Published  var imageUrl: String?
    @Published  var name: String?
    @Published  var detail: String?
    @Published  var missionDate: String?
    @Published  var wikiLink: String?
    @Published  var isShowInfo: Bool = false
    @Published  var isMarked: Bool = false
        
    
    init(mission: Launche) {
        self.mission = mission
    }

    
    public func updateUI() {
        imageUrl = mission.icon
        name = mission.name
        missionDate = mission.dateUTC?.toString
        detail = mission.details
        let infoLink = mission.wikipediaLink
        wikiLink = infoLink
        isShowInfo = (infoLink == nil || infoLink == "")
    }
    
}
