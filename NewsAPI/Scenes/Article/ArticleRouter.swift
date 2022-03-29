//
//  ArticleRouter.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

// MARK: - Protocol
protocol ArticleRoutingLogic {
}

// MARK: - Communication Data Store
protocol ArticleDataPassing {
    var dataStore: ArticleDataStore? { get }
}

class ArticleRouter: NSObject, ArticleRoutingLogic, ArticleDataPassing {

    // MARK: - Properties
    weak var viewController: ArticleViewController?
    var dataStore: ArticleDataStore?

}
