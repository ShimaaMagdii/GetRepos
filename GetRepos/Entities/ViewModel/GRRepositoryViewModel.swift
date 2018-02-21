//
//  GRRepositoryViewModel.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit

// View Model Class to be used on UI
class GRRepositoryViewModel: GRBaseViewModel {
    
    // MARK: - Properties
    var name :String!
    var desc :String?
    var avatarUrl :String?
    var forks: Int?
    var watchers: Int?
    var loginName: String?
    // MARK: - Init
    required public init(name: String!, desc: String?, avatarUrl: String?, forks: Int?, watchers: Int?, loginName: String?) {
        
        self.name = name
        self.desc = desc
        self.avatarUrl = avatarUrl
        self.forks = forks
        self.watchers = watchers
        self.loginName = loginName
    }
    
}

