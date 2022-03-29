//
//  ArticleModels.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import Foundation

// MARK: - Article
public struct Article: Codable {
    var source: Source
    var author: String?
    var title: String
    var articleDescription: String?
    var url: String
    var urlToImage: String?
    var publishedAt: String
    var content: String?
    
    public init() {
        source = Source()
        author = nil
        title = ""
        articleDescription = nil
        url = ""
        urlToImage = nil
        publishedAt = ""
        content = nil
    }
    
    init(source: Source, author: String?, title: String, articleDescription: String?, url: String, urlToImage: String?, publishedAt: String, content: String?) {
        self.source = source
        self.author = author
        self.title = title
        self.articleDescription = articleDescription
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }
}

// MARK: - Source
public struct Source: Codable {
    let id: String?
    let name: String
    
    init() {
        id = nil
        name = ""
    }
    
    public init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
}
