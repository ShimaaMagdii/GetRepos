//
//  GRNetworkManagerTests.swift
//  GetReposTests
//
//  Created by Shimaa Magdi on 2/21/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import XCTest
import Alamofire

@testable import GetRepos

class GRNetworkManagerTests: XCTestCase {
    let requestTimeOut = TimeInterval(120)
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testNetworkReachability() {
        unowned let expectations = expectation(description: "Test Network Reachability")
        
        let urlString = "https://google.com"
        let reachabilityManager = Alamofire.NetworkReachabilityManager(host: urlString)
        
        reachabilityManager?.listener = { status in
            print("Network Status Changed: \(status)")
            switch status {
            case .notReachable:
                XCTFail("The network is not reachable")
                break
            case .unknown :
                XCTFail("It is unknown whether the network is reachable")
                break
            default: break
            }
            reachabilityManager?.stopListening()
            expectations.fulfill()
        }
        reachabilityManager?.startListening()
        waitForExpectations(timeout: requestTimeOut, handler: { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        })
    }
    
    func testPerformRequestWithPath() {
        unowned let expectations = expectation(description: "Test Perform Request With given Path")
        let url = "search/repositories?q=images"
        
        GRNetworkManager.performRequestWithPath(path: url, requestMethod: .get, requestParam: nil, headersParam: nil, success:{ (response) in
            
            XCTAssertNotNil(response, "response is nil")
            expectations.fulfill()
            
        }) { (error) in
            expectations.fulfill()
        }
        waitForExpectations(timeout: requestTimeOut, handler: { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        })
    }
    
    
    func testPerformanceExample() {
        self.measure {
            self.testPerformRequestWithPath()
        }
    }
}
