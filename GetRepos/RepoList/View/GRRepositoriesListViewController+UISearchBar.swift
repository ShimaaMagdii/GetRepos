//
//  GRRepositoriesListViewController+UISearchBar.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit

// MARK: Extension for Repositories List ViewController searchBar and searchController delegates
extension GRRepositoriesListViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    // MARK: - UISearchBarDelegate Methods
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchController.searchBar.text != "" {
            self.searchText = searchController.searchBar.text
        }
    }
    
    // MARK: - UISearchControllerDelegate Methods
    func didDismissSearchController(_ searchController: UISearchController) {
        self.searchText = nil
    }
    
    
}

