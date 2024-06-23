//
//  MissionListView.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import UIKit
import Combine

class MissionListView: UITableViewController {
    var viewModel: MissionListViewModel = MissionListViewModel()
    private var cancellable = Set<AnyCancellable>()
    
    //MARK: 0 life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        applayTheme()
        setupView()
        Task {
            await viewModel.fetch()
        }
    }
    
    private func setupView() {
        self.tableView.register(MissionCell.self)
        self.tableView.separatorStyle = .none
        
    }
    
    private func applayTheme() {
        self.view.backgroundColor = .white
    }
    private func updateState(_ state: MissionListViewModel.State) {
        switch state {
        case .empty:
            //TODO: show empty state
            break;
            
        case .finished:
            self.tableView.reloadData()
            
        case let .error(messge):
            //TODO: show Error message
            break;
            
        case .idle, .loading:
            //TODO: show Progress view
            break;
        }
    }
    
    
    private func bindViewModel() {
        viewModel.$state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                self?.updateState(state)
            }
            .store(in: &cancellable)
    }
    
    // MARK: - Action
    
    
}

// MARK: - Table view data source
extension MissionListView {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MissionCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let item = viewModel.item(index: indexPath.row)
        cell.set(icon: item.icon)
        cell.set(flight: item.flightNumber)
        cell.set(status: item.success ?? false)
        cell.set(description: item.details)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        <#code#>
    }
}

