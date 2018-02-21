//
//  RepoListInteractor.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

class RepoListInteractor: RepoListInteractorInputProtocol {
    weak var presenter: RepoListInteractorOutputProtocol?
    var dataManager: RepoListDataManagerInputProtocol?
    
    func retrieveRepoList(forSearchPhrase searchPhrase: String) {
        dataManager?.retrieveRepoList(forSearchPhrase: searchPhrase)
    }
}

extension RepoListInteractor: RepoListDataManagerOutputProtocol {
    
    func onRepossRetrieved(_ repos: [GRRepositoryViewModel]) {
        presenter?.didRetrieveRepos(repos)
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
