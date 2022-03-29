//
//  ArticleInteractor.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

protocol ArticleBusinessLogic {
    func setArticle()
}

public protocol ArticleDataStore {
    var selectedArticle: Article { get set }
}

class ArticleInteractor: ArticleBusinessLogic, ArticleDataStore {
    
    // MARK: - Properties
    var presenter: ArticlePresentationLogic?
    var viewModel = Article()
    
    // MARK: - ArticleDataStore
    var selectedArticle = Article()

    // MARK: - BusinessLogic
    func setArticle() {
        viewModel = selectedArticle
        presenter?.presentArticle(viewModel: viewModel)
    }

}
