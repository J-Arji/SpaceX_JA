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
    private var docs: [Launche] = []
    private var cancellable = Set<AnyCancellable>()
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        applayTheme()
        setupView()
        bindViewModel()
        viewModel.loadSubject.send(())
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
        case .idle, .loading:
            //TODO: show Progress view
            break;
        case .empty:
            //TODO: show empty state
            break;
            
        case let .finished(items):
            docs.append(contentsOf: items)
            tableView.reloadData()
            
        case let .error(_):
            //TODO: show Error message
            break;
        
        }
    }
    
    private func bindViewModel() {
        viewModel.state
            .receive(on: RunLoop.main)
            .sink { [weak self] state in
                self?.updateState(state)
            }
            .store(in: &cancellable)
    }
    
    
    // MARK: - Action
    func showDetailView(input: Launche) {
        //TODO: show Detail
        let viewModel = MissionDetailViewModel(mission: input)
        let vc = MissionDetailView(viewModel)
        push(vc)
    }
    
}

// MARK: - Table view data source
extension MissionListView {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return docs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MissionCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let item = docs[indexPath.row]
        cell.set(flight: item.flightNumber)
        cell.set(status: item.success ?? false)
        cell.set(description: item.details)
        cell.set(date: item.dateUTC?.toString)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = docs[indexPath.row]
        self.showDetailView(input: item)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? MissionCell {
            cell.set(icon: docs[indexPath.row].icon)
        }
        viewModel.loadMore(index: indexPath.row, lastIndex: docs.count - 1)
    }
}


//MARK: - Route
extension MissionListView: NavigationProtocol { }

