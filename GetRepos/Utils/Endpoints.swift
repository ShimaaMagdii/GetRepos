//
//  Endpoints.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://api.github.com/"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Repos: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "search/repositories?q=%@"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}

