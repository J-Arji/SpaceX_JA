//
//  MissionDetailViewModel.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/23/24.
//

import Foundation
import Combine
import Factory

class MissionDetailViewModel {
    enum State: Equatable {
        case loading
        case error(String)
        case finished(isAdded: Bool)
    }
    
    //MARK: - properties
    @Injected(\.missionDetailReposiotry) private var service
    
    private (set) var state = PassthroughSubject<State, Never>()
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
        imageUrl = mission.image
        name = mission.name
        missionDate = mission.dateUTC?.toString
        detail = mission.details
        let infoLink = mission.wikipediaLink
        wikiLink = infoLink
        isShowInfo = (infoLink == nil || infoLink == "")
        isExist(id: mission.id)
    }
    
    
    public func didtapBookMark(isAdded: Bool) {
        self.state.send(.loading)
        
        isAdded ?  removeFromStore() : addToStore()
    }
    
    private func isExist(id: String ) {
        Task {
            do {
               let isExist = try await service.isExist(key: id)
                isMarked = isExist
            } catch {
                isMarked = false
            }
        }
    }
    
    private func removeFromStore() {
        Task {
            do {
                try await service.remove(key: mission.id)
                state.send(.finished(isAdded: false))
            } catch let error {
                let message = (error as? DataTransferError)?.description ?? error.localizedDescription
                state.send(.error(message))
            }
        }
    }
    
    private func addToStore() {
        Task {
            do {
                try await service.save(object: mission)
                state.send(.finished(isAdded: true))
            } catch let error {
                let message = (error as? DataTransferError)?.description ?? error.localizedDescription
                state.send(.error(message))
            }
        }
    }
}



extension MissionDetailViewModel {
    enum Constants {
        enum Size {
            static let leftStackWidth = 50.0
            static let imageViweHeight = 250.0
            static let dateLabelHeigh = 20.0
            static let titleStackViewHeight = 30.0
            static let bookmarkButtonWidth = 30.0
            static let space = 8.0
            static let multiplier = 1.0
            static let padding = 8.0
            static let bookmarkTopPadding = 10.0
        }
        enum Int {
            static let descriptionNumberLine = 1
        }
    }
}
