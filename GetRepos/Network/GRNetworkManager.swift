//
//  GRNetworkManager.swift
//  GetRepos
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import Foundation
import Alamofire

typealias SuccessNetworkClousre = (Any?)  -> Void
typealias FailureNetworkClousre = (Error) -> Void

public class GRNetworkManager {
    
    /**
     Requests data from API and get the response back.
     
     - Parameter baseURL: Base URL for the API.. Default value is https://api.github.com
     - Parameter path: API path.
     - Parameter requestMethod: request method .GET .POST etc..
     - Parameter parameters: request parameters.
     - Parameter headers: request headers.
     - Parameter success: response success block.
     - Parameter failure: response failure block.
     */
    
    class func performRequestWithPath (baseUrl          :String = API.baseUrl,
                                       path             :String?,
                                       requestMethod    :Alamofire.HTTPMethod,
                                       requestParam     :[String: Any]?,
                                       headersParam     :[String: String]?,
                                       success          :@escaping SuccessNetworkClousre,
                                       failure          :@escaping FailureNetworkClousre){
        
        
        let url = (path != nil) ? baseUrl + path! : baseUrl
        Alamofire.request(url, method: requestMethod, parameters: requestParam, headers: headersParam)
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case  .success(_):
                    success(response.result.value)
                case .failure(let error):
                    failure(error)
                }
        }
    }
    
}

