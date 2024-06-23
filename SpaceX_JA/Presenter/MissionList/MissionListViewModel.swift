//
//  MissionListViewModel.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import Foundation
import Combine
import Resolver

protocol MissionDataSource {
    func numberOfRows() -> Int
    func item(index: Int) -> Launche
}

class MissionListViewModel {
    enum State: Equatable {
        case idle
        case loading
        case empty
        case finished
        case error(String)
    }
    
    //MARK: - Properties
    @Published private (set) var state: State = .idle
    @Published private (set) var launches: [Launche] = []
    @Injected var service: MissionListRepository
    
    
    //MARK: - fetch data
    public func fetch(launch page: Int = 1, limit: Int = 20) async {
        self.state = .loading
        let parameter = LaunchInput.init(limit: limit, page: page)
        do {
            let missions =  try await service.fetch(input: parameter)
            self.launches.append(contentsOf: missions.docs)
            self.state = missions.docs.count > 0 ?  .finished : .empty
            
        } catch let error {
            let message = (error as? HTTPError)?.description ?? error.localizedDescription
            state = .error(message)
        }
    }
}

//MARK: - Data source
extension MissionListViewModel: MissionDataSource {
    func numberOfRows() -> Int {
        launches.count
    }
    
    func item(index: Int) -> Launche {
        launches[index]
    }
    
    
}
