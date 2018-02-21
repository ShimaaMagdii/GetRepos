//
//  RepoListDataManager.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import Foundation
import ObjectMapper

class RepoListDataManager: RepoListDataManagerInputProtocol {
    var requestHandler: RepoListDataManagerOutputProtocol?
    
    func retrieveRepoList(forSearchPhrase searchPhrase: String) {
        let path = String(format:Endpoints.Repos.fetch.path, searchPhrase)
        GRNetworkManager.performRequestWithPath(baseUrl: API.baseUrl, path: path, requestMethod: .get, requestParam: nil, headersParam: nil, success: { (reponse) in
            
            let  repositoriesData:  GRRepositoriesListModel? = Mapper<GRRepositoriesListModel>().map(JSONObject: reponse)
            
            let repositoryList: [GRRepositoryViewModel]? = GRMappingManager.mapRepositoryListToRepositoryViewModel(repositoryListData: repositoriesData)
            self.requestHandler?.onRepossRetrieved(repositoryList!)
            
        }, failure: {_ in
            self.requestHandler?.onError()
        })
    }
    
}
