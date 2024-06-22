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
        case finished
        case error(String)
    }
    
    @Published private (set) var state: State = .idle
    @Injected var service: MissionListRepository
    
    func fetch(launch page: Int, limit: Int) async {
        let parameter = LaunchInput.init(limit: limit, page: page)
        do {
            let missions =  try await service.fetch(input: parameter)
            print(missions)
        } catch let error {
            if let em = error as? HTTPError {
                
                print(em.description)
            } else {
                HTTPError.unknown(error.localizedDescription).description
            }
        }

    }
}

extension MissionListViewModel {
    
}
