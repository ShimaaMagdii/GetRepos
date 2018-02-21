//
//  RepoListProtocols.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit

protocol RepoListViewProtocol: class {
    var presenter: RepoListPresenterProtocol? { get set }
    var searchText: String? { get set }
    
    // PRESENTER -> VIEW
    func showRepos(with repos: [GRRepositoryViewModel])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol RepoListWireFrameProtocol: class {
    static func createRepoListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentRepoDetailScreen(from view: RepoListViewProtocol, forRepo repo: GRRepositoryViewModel)
}

protocol RepoListPresenterProtocol: class {
    var view: RepoListViewProtocol? { get set }
    var interactor: RepoListInteractorInputProtocol? { get set }
    var wireFrame: RepoListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showRepoDetails(forRepo repo: GRRepositoryViewModel)
    func loadData(forSearchText searchText: String)
}

protocol RepoListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveRepos(_ repos: [GRRepositoryViewModel])
    func onError()
}

protocol RepoListInteractorInputProtocol: class {
    var presenter: RepoListInteractorOutputProtocol? { get set }
    var dataManager: RepoListDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveRepoList(forSearchPhrase searchPhrase: String)
}

protocol PostListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol RepoListDataManagerInputProtocol: class {
    var requestHandler: RepoListDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveRepoList(forSearchPhrase searchPhrase: String)
}

protocol RepoListDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onRepossRetrieved(_ repos: [GRRepositoryViewModel])
    func onError()
}

