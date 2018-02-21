//
//  GRRepoDetailViewController.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/21/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//
import UIKit
import Kingfisher

class GRRepoDetailViewController: GRBaseViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginNameLabel: UILabel!
    
    var presenter: RepoDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension GRRepoDetailViewController: RepoDetailViewProtocol {
    
    func showRepoDetail(forRepo repo: GRRepositoryViewModel) {
        titleLabel?.text = repo.name
        loginNameLabel.text = repo.loginName
        
        if let urlString = repo.avatarUrl {
            let url = URL(string: urlString)
            avatarImageView.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeHolder"), options: nil, progressBlock: nil, completionHandler: nil)
        }
    }
}
