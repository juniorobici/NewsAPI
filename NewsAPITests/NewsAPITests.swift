//
//  NewsAPITests.swift
//  NewsAPITests
//
//  Created by Junior Obici on 28/03/22.
//

import XCTest
@testable import NewsAPI

class NewsAPITests: XCTestCase {
    
    func testGetAllCategories() {
        let mainVC = MainNewsViewController()
        let categories = mainVC.getAllCategories()
        XCTAssertNotNil(categories)
    }

    func testGetAllSorts() {
        let mainVC = MainNewsViewController()
        let sorts = mainVC.getAllSorts()
        XCTAssertNotNil(sorts)
    }
    
    func testGetDeviceCountry() {
        let mainInteractor = MainNewsInteractor()
        let country = mainInteractor.getDeviceCountry()
        XCTAssertNotNil(country)
    }
    
    func testConvertStringsDate() {
        let dateIn: String = "2022-03-29T10:00:24Z"
        let maskIn: String = "yyyy-MM-dd'T'HH:mm:ssZ"
        let maskOut: String = "dd/MM/yyyy HH:mm"
        
        let result = dateIn.convertStringsDate(maskIn, maskOut)
        
        XCTAssertEqual(result, "29/03/2022 07:00")
    }
    
    func testTremoveTruncated() {
        let text: String = "Eliminatórias Sul-Am… [+1282 chars]"
        let result: String = text.removeTruncated(string: " [+")
        XCTAssertEqual(result, "Eliminatórias Sul-Am…")
    }
    
    func testFetchNews() {
        let mainWorker = MainNewsWorker()
        let mainInteractor = MainNewsInteractor()
        var newsResult = News()
        
        let exp = expectation(description: "Fetch news is successful")
        
        mainWorker.fetchNews(country: mainInteractor.getDeviceCountry(), category: NewsCategory.technology.rawValue, pageSize: 20, page: 1, sortBy: NewsSortBy.relevancy.rawValue) { news in
            newsResult = news
            exp.fulfill()
        } onError: { error in
            newsResult = News()
        }
        
        waitForExpectations(timeout: 3) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            XCTAssertGreaterThanOrEqual(newsResult.articles.count, 0)
        }
    }
    
}
