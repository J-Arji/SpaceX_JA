//
//  MissionListViewModel.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation
import Combine
import Factory

class MissionListViewModel: ObservableObject {

    enum State: Equatable {
        case idle
        case loading
        case empty
        case finished([Launche])
        case error(String)
    }
    
    //MARK: - Properties
    @Injected(\.missionlistRepository) private var service
    private (set) var state = CurrentValueSubject<State, Never>(.idle)
    private (set) var mission: LaunchesPage?
    private var hasNextPage: Bool {
        return mission?.hasNextPage ?? false
    }
    

    
    //MARK: - fetch data
    public func fetch(launch page: Int = Constants.Int.page, limit: Int = Constants.Int.defaultLimit)  {
        let parameter = LaunchInput.init(limit: limit, page: page)
        Task {
            do {
                let mission =  try await service.fetch(input: parameter)
                self.mission = mission
                self.state.send(mission.docs.count > 0 ?  .finished(mission.docs) : .empty)
                
            } catch let error {
                let message = (error as? DataTransferError)?.description ?? error.localizedDescription
                state.send(.error(message))
            }
        }
    }
    
    public func loadMore(index: Int, lastIndex: Int) {
        guard let nextPage = mission?.nextPage else { return }
        let isLoading = (state.value != .loading || state.value != .idle)
        guard index == lastIndex, isLoading, hasNextPage else { return }

        state.send(.loading)
        fetch(launch: nextPage, limit: Constants.Int.limit)
        
    }
}




extension MissionListViewModel {
    enum Constants {
        enum Int {
            static let page = 1
            static let limit = 50
            static let defaultLimit = 20
            static let defaultNumberLine = 1
            static let descriptionNumberLine = 3
        }
        
        enum Size {
            static let cellTotalStackViewMargin = 16.0
            static let cellTotalStackViewHeight = 120.0
            static let cellStatusLabelHeight = 20.0
            static let cellIconImageViewHeight = 50.0
            static let cellDateLabelHeight = 15.0
            static let cellMultiplier = 1.0
        }
        
    }
}
