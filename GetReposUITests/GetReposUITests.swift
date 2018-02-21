//
//  GetReposUITests.swift
//  GetReposUITests
//
//  Created by Shimaa Magdi on 2/19/18.
//  Copyright © 2018 Shimaa Magdi. All rights reserved.
//

import XCTest

class GetReposUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
        super.tearDown()
    }
    
    func testSearchBarWorksWithTable() {
        //given
        let tableView = app.tables.element
        let searchSearchField = app.tables.searchFields["Search"]
        let searchBarButton = app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards.buttons[\"Search\"]",".buttons[\"Search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(tableView.cells.count == 0)
        
        //then
        searchSearchField.tap()
        app.searchFields["Search"].typeText("Test")
        searchBarButton.tap()
        
        sleep(5)
        XCTAssertTrue(tableView.cells.count > 0)
    }
    
    func testUITableView() {
        //given
        let tableView = app.tables.element
        let searchSearchField = app.tables.searchFields["Search"]
        let searchBarButton = app/*@START_MENU_TOKEN@*/.buttons["Search"]/*[[".keyboards.buttons[\"Search\"]",".buttons[\"Search\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        //then
        searchSearchField.tap()
        app.searchFields["Search"].typeText("Test")
        searchBarButton.tap()
        
        let lastCell = tableView.cells.element(boundBy: 9)
        tableView.scrollToElement(element: lastCell)
        XCTAssertFalse(tableView.cells.count == 0)
    }
    
}


extension XCUIElement {
    func scrollToElement(element: XCUIElement) {
        for _ in 0..<10 {
            swipeUp()
        }
    }
}


