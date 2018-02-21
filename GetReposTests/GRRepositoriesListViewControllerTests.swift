//
//  GRRepositoriesListViewControllerTests.swift
//  GetReposTests
//
//  Created by Shimaa Magdi on 2/21/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import UIKit
import XCTest

@testable import GetRepos

class GRRepositoriesListViewControllerTests: XCTestCase {
    
    //declaring the ViewController under test as an implicitly unwrapped optional
    var repositoriesListVCTests : GRRepositoriesListViewController!
    
    override func setUp() {
        super.setUp()
        repositoriesListVCTests = GRRepositoriesListViewController.create()
        
        //load view hierarchy
        if(repositoriesListVCTests != nil) {
            
            repositoriesListVCTests.loadView()
            repositoriesListVCTests.viewDidLoad()
        }
    }
    
    override func tearDown() {
        repositoriesListVCTests = nil
        super.tearDown()
    }
    
    func testViewControllerIsComposedOfTableView() {
        
        XCTAssertNotNil(repositoriesListVCTests.repositoryTableView, "repositoryTableView under test is not composed of a TableView")
    }
    
    func testControllerConformsToTableViewDelegate() {
        XCTAssert(repositoriesListVCTests.conforms(to: UITableViewDelegate.self), "repositoriesListViewController under test does not conform to UITableViewDelegate protocol")
        XCTAssert(repositoriesListVCTests.conforms(to: UITableViewDataSource.self), "repositoriesListViewController under test does not conform to UITableViewDataSource protocol")
    }
    
    func testTableViewViewDelegateIsSet() {
        
        XCTAssertNotNil(self.repositoriesListVCTests.repositoryTableView.delegate)
    }
    
    func testControllerImplementsTableViewDelegateMethods() {
        
        XCTAssert(repositoriesListVCTests.responds(to: #selector(UITableViewDataSource.tableView(_:numberOfRowsInSection:))),"ViewController under test does not implement tableView:numberOfRowsInSection")
        
        XCTAssert(repositoriesListVCTests.responds(to: #selector(UITableViewDelegate.tableView(_:didSelectRowAt:))),"ViewController under test does not implement tableView:didSelectRowAt")
    }
    
}

