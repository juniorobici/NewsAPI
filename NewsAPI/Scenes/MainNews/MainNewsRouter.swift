//
//  MainNewsRouter.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

// MARK: - Protocol
protocol MainNewsRoutingLogic {
    func routeToArticle()
    func routeToFilter()
}

// MARK: - Communication Data Store
protocol MainNewsDataPassing {
    var dataStore: MainNewsDataStore? { get }
}

class MainNewsRouter: NSObject, MainNewsRoutingLogic, MainNewsDataPassing {

    // MARK: - Properties
    weak var viewController: MainNewsViewController?
    var dataStore: MainNewsDataStore?
    
    // MARK: - Login
    func routeToArticle() {
        let destinationViewController = ArticleViewController()
        guard let ds = dataStore, var destinationDS = destinationViewController.router?.dataStore, let vc = viewController else {
            return
        }
        passDataToArticle(source: ds, destination: &destinationDS)
        navigateToArticle(source: vc, destination: destinationViewController)
    }
    
    func routeToFilter() {
        let destinationViewController = FilterTableViewController()
        guard let ds = dataStore, var destinationDS = destinationViewController.router?.dataStore, let vc = viewController else {
            return
        }
        passDataToFilter(source: ds, destination: &destinationDS)
        navigateToFilter(source: vc, destination: destinationViewController)
    }
    
    // MARK: - Passing data Login
    func passDataToArticle(source: MainNewsDataStore, destination: inout ArticleDataStore) {
        destination.selectedArticle = source.selectedArticle
    }
    
    func passDataToFilter(source: MainNewsDataStore, destination: inout FilterDataStore) {
        destination.selectedFilter = source.selectedFilter
    }
    
    // MARK: - Navigation Login
    func navigateToArticle(source: MainNewsViewController, destination: ArticleViewController) {
        source.navigationController?.pushViewController(destination, animated: true)
    }
    
    func navigateToFilter(source: MainNewsViewController, destination: FilterTableViewController) {
        destination.delegate = source.self
        source.navigationController?.pushViewController(destination, animated: true)
    }
}
