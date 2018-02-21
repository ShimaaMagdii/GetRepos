//
//  GRMappingManagerTests.swift
//  GetReposTests
//
//  Created by Shimaa Magdi on 2/21/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import XCTest
import ObjectMapper

@testable import GetRepos

class GRMappingManagerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testMapVehicleListToVehicleViewModel() {
        if let json = readJsonData() {
            
            let  repositoriesData:  GRRepositoriesListModel? = Mapper<GRRepositoriesListModel>().map(JSONObject: json)
            
            XCTAssertNotNil(repositoriesData)
            XCTAssertEqual(repositoriesData?.repositoriesList?.count, 2)
            XCTAssertEqual(repositoriesData?.totalCount, 10)
            
            let repositoryList: [GRRepositoryViewModel]? = GRMappingManager.mapRepositoryListToRepositoryViewModel(repositoryListData: repositoriesData)
            
            let firstModel = repositoryList?.first
            let lastModel = repositoryList?.last
            
            XCTAssertNotNil(repositoryList)
            XCTAssertEqual(repositoryList?.count, 2)
            
            XCTAssertEqual(firstModel?.name, "A1")
            XCTAssertEqual(lastModel!.desc, "A theme for an old version Redmine. Based on the original A1, but adds a media query based mobile layout.")
            XCTAssertEqual(lastModel!.forks, 8)
        }
        
    }
    
    private func readJsonData() -> [String : Any]? {
        var jsonResult: [String:Any]?
        do {
            let testBundle = Bundle(for: type(of: self))
            if let file = testBundle.url(forResource: "repositoriesData", withExtension: "json") {
                let data = try Data(contentsOf: file)
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let object = json as? [String: Any] {
                    jsonResult =  object
                } else if let object = json as? [Any] {
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        return jsonResult
    }
}

