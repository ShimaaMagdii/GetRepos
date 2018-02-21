//
//  RepoListPresenter.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

class RepoListPresenter: RepoListPresenterProtocol {
    weak var view: RepoListViewProtocol?
    var interactor: RepoListInteractorInputProtocol?
    var wireFrame: RepoListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveRepoList(forSearchPhrase: (view?.searchText)!)
    }
    
    func showRepoDetails(forRepo repo: GRRepositoryViewModel) {
        wireFrame?.presentRepoDetailScreen(from: view!, forRepo: repo)
    }
    
    func loadData(forSearchText searchText: String) {
        interactor?.retrieveRepoList(forSearchPhrase: searchText)
        
    }
    
    
}

extension RepoListPresenter: RepoListInteractorOutputProtocol {
    
    func didRetrieveRepos(_ repos: [GRRepositoryViewModel]){
        view?.hideLoading()
        view?.showRepos(with: repos)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}
