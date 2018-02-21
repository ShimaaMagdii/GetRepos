//
//  RepoDetailProtocols.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/21/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit

protocol RepoDetailViewProtocol: class {
    var presenter: RepoDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showRepoDetail(forRepo repo: GRRepositoryViewModel)
}

protocol RepoDetailWireFrameProtocol: class {
    static func createRepoDetailModule(forRepo repo: GRRepositoryViewModel) -> UIViewController
}

protocol RepoDetailPresenterProtocol: class {
    var view: RepoDetailViewProtocol? { get set }
    var wireFrame: RepoDetailWireFrameProtocol? { get set }
    var repo: GRRepositoryViewModel? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
}
