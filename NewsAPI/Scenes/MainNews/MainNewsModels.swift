//
//  MainNewsModels.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import Foundation

// MARK: - News
public struct News: Codable {
    
    var status: String
    var totalResults: Int
    var articles: [Article]
    
    public init() {
        status = ""
        totalResults = 0
        articles = []
    }
    
    init(status: String, totalResults: Int, articles: [Article]) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
    
}
