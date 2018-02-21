//
//  RepoDetailPresenter.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/21/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import Foundation

class RepoDetailPresenter: RepoDetailPresenterProtocol {
    
    weak var view: RepoDetailViewProtocol?
    var wireFrame: RepoDetailWireFrameProtocol?
    var repo: GRRepositoryViewModel?
    
    func viewDidLoad() {
        view?.showRepoDetail(forRepo: repo!)
    }
    
}
