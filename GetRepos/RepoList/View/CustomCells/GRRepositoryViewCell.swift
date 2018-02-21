//
//  GRRepositoryViewCell.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
import Kingfisher

typealias ImageDownloadCompletion = () -> Void

/**
 *  GRRepositoryViewCell table view cell displays the repository details.
 */
class GRRepositoryViewCell : UITableViewCell {
    
    // MARK: - Outlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var ownerAvatar: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 4
        containerView.dropCardShadow()
    }
    
    /**
     Customize Cell With Model displays details for each repository model.
     - Parameter repository: GRRepositoryViewModel contains repository details.
     - Parameter completion: ImageDownloadCompletion colusre that handles getting the image.
     */
    func customizeCellWithModel(_ repository: GRRepositoryViewModel?,  completion: @escaping ImageDownloadCompletion) {
        if let repositoryModel = repository {
            nameLabel.text = repositoryModel.name
            descLabel.text = repositoryModel.desc
            if let forks =  repositoryModel.forks {
                forksLabel.text = "\(forks)"
            }
            if let watchers =  repositoryModel.watchers {
                watchersLabel.text = "\(watchers)"
            }
            if let urlString = repository?.avatarUrl{
                let url = URL(string: urlString)
                ownerAvatar.kf.setImage(with: url, placeholder: #imageLiteral(resourceName: "placeHolder"), options: nil, progressBlock: nil, completionHandler: {(image, error, cacheType, url) in
                    if cacheType == .none || cacheType == .disk {
                        completion()
                    }
                })
            }
        }
    }
    
    
}





