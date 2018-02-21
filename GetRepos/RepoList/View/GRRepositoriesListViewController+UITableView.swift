//
//  GRRepositoriesListViewController+UITableView.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit

// MARK: Extension for Repositories List ViewController table view delegate and datasource
extension GRRepositoriesListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return repositoriesList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: GRRepositoryViewCell  = tableView.dequeueReusableCell(withIdentifier: UITableViewCellIdentifier.gettyCellIdentifier) as! GRRepositoryViewCell
        cell.customizeCellWithModel(repositoriesList[indexPath.row],
                                    completion: { [weak self] in
                                        self?.repositoryTableView.beginUpdates()
                                        self?.repositoryTableView.endUpdates()
        })
        
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showRepoDetails(forRepo: repositoriesList[indexPath.row])
    }
    
    
}

