//
//  RepoListWireFrame.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit

class RepoListWireFrame: RepoListWireFrameProtocol {
    
    class func createRepoListModule() -> UIViewController {
        
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ReposNavigationController")
        if let view = navController.childViewControllers.first as? GRRepositoriesListViewController {
            let presenter: RepoListPresenterProtocol & RepoListInteractorOutputProtocol = RepoListPresenter()
            let interactor: RepoListInteractorInputProtocol & RepoListDataManagerOutputProtocol = RepoListInteractor()
            let dataManager: RepoListDataManagerInputProtocol = RepoListDataManager()
            let wireFrame: RepoListWireFrameProtocol = RepoListWireFrame()
            
            view.searchText = "test"
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.dataManager = dataManager
            dataManager.requestHandler = interactor
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    
    func presentRepoDetailScreen(from view: RepoListViewProtocol, forRepo repo: GRRepositoryViewModel) {
        //let postDetailViewController = PostDetailWireFrame.createPostDetailModule(forPost: post)
        
        if let sourceView = view as? UIViewController {
            //  sourceView.navigationController?.pushViewController(postDetailViewController, animated: true)
        }
    }
    
}
