//
//  NetworkManager.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let basePath = "https://newsapi.org/v2/top-headlines?"
    private let APIKEY = "xxxxxxxxxxxxxxxxxx"
    
    func fetchCountryNews (country: String, category: String, pageSize: Int, page: Int, sortBy: String, completion: @escaping (News) -> Void, onError: @escaping (String) -> Void) {
        guard let url = URL(string: "\(basePath)country=\(country)&category=\(category)&pageSize=\(pageSize)&page=\(page)&sortBy=\(sortBy)&apiKey=\(APIKEY)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                onError(error.localizedDescription)
                return
            }
            do {
                guard let data = data else {return}
                let news = try JSONDecoder().decode(News.self, from: data)
                completion(news)
            } catch let error {
                onError(error.localizedDescription)
                return
            }
        }.resume()
    }
}
