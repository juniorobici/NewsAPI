//
//  FilterModels.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import Foundation

// MARK: - Filter
public struct Filter: Mappable {
    var category: [String]
    var sort: [String]
    
    public init() {
        category = []
        sort = []
    }
    
    init(category: [String], sort: [String]) {
        self.category = category
        self.sort = sort
    }
    
}

// MARK: - Filter Response
public struct FilterResponse: Mappable {
    var category: String
    var sort: String
    
    public init() {
        category = ""
        sort = ""
    }
    
    init(category: String, sort: String) {
        self.category = category
        self.sort = sort
    }
    
}
