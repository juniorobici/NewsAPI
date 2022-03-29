//
//  MainNewsWorker.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

// MARK: - Protocol
protocol MainNewsRemoteAccess: AnyObject {
    func fetchNews(country: String, category: String, pageSize: Int, page: Int, sortBy: String, completion: @escaping(News) -> Void, onError: @escaping (String) -> Void)
}

class MainNewsWorker: MainNewsRemoteAccess {
    
    // MARK: - Properties
    private let networkManager: NetworkManager
    
    // MARK: - Init
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    // MARK: - MainNewsRemoteAccess
    func fetchNews(country: String, category: String, pageSize: Int, page: Int, sortBy: String, completion: @escaping(News) -> Void, onError: @escaping (String) -> Void) {
        networkManager.fetchCountryNews(country: country, category: category, pageSize: pageSize, page: page, sortBy: sortBy) { response in
            completion(response)
        } onError: { error in
            onError(error.description)
        }
    }
}
