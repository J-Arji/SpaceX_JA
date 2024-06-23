//
//  MissionListViewModel.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation
import Combine
import Resolver


class MissionListViewModel {
    enum State: Equatable {
        case idle
        case loading
        case empty
        case finished([Launche])
        case error(String)
    }
    
    //MARK: - Properties
    @Injected var service: MissionListRepository
    @Published private (set) var state = CurrentValueSubject<State, Never>(.idle)
    private(set) var loadSubject = PassthroughSubject<Void, Never>()
    private (set) var mission: LaunchesPage?
    private var cancellables = Set<AnyCancellable>()
    private var hasNextPage: Bool {
        return mission?.hasNextPage ?? false
    }
    
    init() {
        loadSubject
            .receive(on: RunLoop.main)
            .sink { [weak self] in
                self?.fetch()
            }
            .store(in: &cancellables)
    }
    
    //MARK: - fetch data
    public func fetch(launch page: Int = 1, limit: Int = 20)  {
        let parameter = LaunchInput.init(limit: limit, page: page)
        Task {
            do {
                let mission =  try await service.fetch(input: parameter)
                self.mission = mission
                self.state.send(mission.docs.count > 0 ?  .finished(mission.docs) : .empty)
                
            } catch let error {
                let message = (error as? HTTPError)?.description ?? error.localizedDescription
                state.send(.error(message))
            }
        }
    }
    
    public func loadMore(index: Int, lastIndex: Int) {
        guard let nextPage = mission?.nextPage else { return }
        let isLoading = (state.value != .loading || state.value != .idle)
        if index == lastIndex, hasNextPage, isLoading {
            state.send(.loading)
                 fetch(launch: nextPage, limit: 50)
        }
    }
}


