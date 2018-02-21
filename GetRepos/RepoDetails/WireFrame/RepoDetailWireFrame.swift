//
//  RepoDetailWireFrame.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/21/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit

class RepoDetailWireFrame: RepoDetailWireFrameProtocol {
    static func createRepoDetailModule(forRepo repo: GRRepositoryViewModel) -> UIViewController {
        
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: StoryboardIdentifier.repoDetailsVCIdentifier)
        if let view = viewController as? GRRepoDetailViewController {
            let presenter: RepoDetailPresenterProtocol = RepoDetailPresenter()
            let wireFrame: RepoDetailWireFrameProtocol = RepoDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.repo = repo
            presenter.wireFrame = wireFrame
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: StoryboardIdentifier.mainStoryboardIdentifier, bundle: Bundle.main)
    }
    
}


