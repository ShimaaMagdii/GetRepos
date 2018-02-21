//
//  GRRepositoriesListViewController+RepoListViewProtocol.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import Foundation

// MARK: Extension for Repositories List ViewController controller protocol
extension GRRepositoriesListViewController: RepoListViewProtocol {
    
    func showRepos(with repos: [GRRepositoryViewModel]) {
        self.repositoriesList = repos
    }
    
    func showError() {
        self.showMessage(message: "There is something wrong will back soon")
    }
    
    func showLoading() {
        showProgressBar()
    }
    
    func hideLoading() {
        hideProgressBar()
    }
    
}
