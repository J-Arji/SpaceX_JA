//
//  MissionListView.swift
//  SpaceX_JA
//
//  Created by javad Arji on 6/21/24.
//

import UIKit

class MissionListView: UITableViewController {
    
    //MARK: 0 life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupView() {
        self.tableView.register(MissionCell.self)
        self.tableView.separatorStyle = .none
    }
    
    
}

// MARK: - Table view data source
extension MissionListView {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}

