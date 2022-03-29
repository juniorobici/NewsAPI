//
//  NewsAPIUITests.swift
//  NewsAPIUITests
//
//  Created by Junior Obici on 28/03/22.
//

import XCTest

class NewsAPIUITests: XCTestCase {

    private let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        app.launchArguments.append("UITest")
        continueAfterFailure = false
    }
    
    func testSwipe() {
        app.launch()
        
        let tableNews = app.tables.element(boundBy: 0)
        let swipeNumber = 2
        
        //Swipe table for X times
        if tableNews.cells.element.exists {
            for _ in 0..<swipeNumber {
                tableNews.swipeUp(velocity: .fast)
            }
        }
    }
    
    func testTouchArticle() {
        app.launch()
        
        //Touch in second article
        let tableFilter = app.tables.element(boundBy: 0)
        tableFilter.cells.element(boundBy: 1).tap()
    }
    
    func testApplyFilter() {
        app.launch()
        
        //Touch in Filter
        app.navigationBars.buttons["filterButton"].tap()
        
        //Touch in filter items
        let tableFilter = app.tables.element(boundBy: 0)
        tableFilter.cells.element(boundBy: 1).tap()
        tableFilter.cells.element(boundBy: 6).tap()

        //Touch Apply Filter Button
        app.buttons["applyFilterButton"].tap()
        
        //Scroll news with new filter
        let tableNews = app.tables.element(boundBy: 0)
        tableNews.swipeUp(velocity: .fast)
    }
    
}
