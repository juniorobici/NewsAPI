//
//  ArticlePresenter.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

// MARK: - Protocol
protocol ArticlePresentationLogic {
    func presentArticle(viewModel: Article)
}

class ArticlePresenter: ArticlePresentationLogic {
    
    // MARK: - Properties
    weak var viewController: ArticleDisplayLogic?
    
    // MARK: - ArticlePresentationLogic
    func presentArticle(viewModel: Article) {
        let presentViewModel = Article(source: viewModel.source,
                                       author: viewModel.author,
                                       title: viewModel.title.removeTruncated(string: " - "),
                                       articleDescription: viewModel.articleDescription,
                                       url: viewModel.url,
                                       urlToImage: viewModel.urlToImage,
                                       publishedAt: viewModel.publishedAt.convertStringsDate("yyyy-MM-dd'T'HH:mm:ssZ", "dd/MM/yyyy HH:mm"),
                                       content: viewModel.content?.removeTruncated(string: " [+"))
        
        viewController?.displayArticle(viewModel: presentViewModel)
    }
    
}
