//
//  GRMappingManager.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import Foundation

class GRMappingManager {
    
    /**
     Map repositoryModel to RepositoryViewModel.
     
     - Parameter GRRepositoryModel: repositoryModel to be mapped.
     - Returns : mapped GRRepositoryViewModel array.
     .
     */
    class func mapRepositoryListToRepositoryViewModel(repositoryListData: GRRepositoriesListModel?) -> [GRRepositoryViewModel] {
        
        var repositoriesList = [GRRepositoryViewModel]()
        if let repositories = repositoryListData?.repositoriesList {
            for repository in repositories  {
                let newRepositoryModel =  GRRepositoryViewModel(name: repository.name, desc: repository.desc, avatarUrl: repository.owner?.avatarUrl, forks: repository.forksCount, watchers: repository.watchersCount)
                repositoriesList.append(newRepositoryModel)
            }
            
        }
        return repositoriesList
        
    }
    
    
    
}
