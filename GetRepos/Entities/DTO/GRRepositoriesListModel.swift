//
//  GRRepositoriesListModel.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import Foundation
import ObjectMapper

// DTO Class to parse content of Repositories API into.
class GRRepositoriesListModel :GRBaseMappable {
    
    private(set) var totalCount        : Int?
    private(set) var repositoriesList  : [GRRepositoryModel]?
    
    override func mapping(map: Map) {
        totalCount                     <- map [MappingKey.totalCount]
        repositoriesList               <- map [MappingKey.repositoriesList]
    }
}

class GRRepositoryModel : GRBaseMappable {
    
    private(set) var id                : Int!
    private(set) var name              : String!
    private(set) var owner             : GROwnerModel?
    private(set) var desc              : String?
    private(set) var forksCount        : Int?
    private(set) var watchersCount     : Int?
    private(set) var subscribersUrl    : String?
    
    override func mapping(map: Map) {
        id                             <- map [MappingKey.id]
        name                           <- map [MappingKey.name]
        owner                          <- map [MappingKey.owner]
        desc                           <- map [MappingKey.desc]
        forksCount                     <- map [MappingKey.forksCount]
        watchersCount                  <- map [MappingKey.watchersCount]
    }
}

class GROwnerModel : GRBaseMappable {
    private(set) var id                : Int!
    private(set) var avatarUrl         : String?
    
    override func mapping(map: Map) {
        id                             <- map [MappingKey.id]
        avatarUrl                      <- map [MappingKey.avatarUrl]
    }
}

fileprivate struct MappingKey {
    
    static let name                   : String = "name"
    static let id                     : String = "id"
    static let avatarUrl              : String = "avatar_url"
    static let owner                  : String = "owner"
    static let desc                   : String = "description"
    static let forksCount             : String = "forks_count"
    static let repositoriesList       : String = "items"
    static let subscribersUrl         : String = "subscribers_url"
    static let totalCount             : String = "total_count"
    static let watchersCount          : String = "watchers_count"
    
}

