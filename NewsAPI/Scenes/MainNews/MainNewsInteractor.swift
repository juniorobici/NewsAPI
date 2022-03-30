//
//  MainNewsInteractor.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

protocol MainNewsBusinessLogic {
    var fetchMore: Bool { get set }
    var currentPage: Int { get set }
    var totalResults: Int { get set }
    func fetchNews(category: NewsCategory, sortBy: NewsSortBy)
    func setSelectedFilter(filter: FilterResponse)
    func resetViewModel()
    func getNumberOfRows() -> Int
    func didSelectItem(at index: Int)
}

public protocol MainNewsDataStore {
    var selectedArticle: Article { get set }
    var selectedFilter: FilterResponse { get set }
}

class MainNewsInteractor: MainNewsBusinessLogic, MainNewsDataStore {
    
    // MARK: - Properties
    var presenter: MainNewsPresentationLogic?
    var worker: MainNewsRemoteAccess
    var viewModel = News()
    var fetchMore: Bool = false
    var currentPage: Int = 1
    var totalResults: Int = 0
    var pageSize: Int = 20
    
    // MARK: - MainNewsDataStore
    var selectedArticle = Article()
    var selectedFilter = FilterResponse()

    // MARK: - Init
    init(worker: MainNewsRemoteAccess = MainNewsWorker()) {
        self.worker = worker
    }
    
    // MARK: - BusinessLogic
    func fetchNews(category: NewsCategory, sortBy: NewsSortBy) {
        presenter?.presentLoader()
        self.fetchMore = true
        worker.fetchNews(country: getDeviceCountry(), category: category.rawValue, pageSize: pageSize, page: currentPage, sortBy: sortBy.rawValue) { [weak self] news in
            self?.handleResponse(news)
        } onError: { error in
            self.handleError(error.description)
        }
    }
    
    private func handleResponse(_ response: News) {
        fetchMore = false
        if response.articles.isEmpty {
            return
        }
        setViewModel(response)
        presenter?.presentNews(viewModel: response)
        presenter?.hideLoader()
    }
    
    func handleError(_ error: String) {
        fetchMore = false
        presenter?.hideLoader()
        presenter?.presentMessage(title: error.description, type: .error)
    }
    
    func setSelectedFilter(filter: FilterResponse) {
        self.selectedFilter = filter
    }
    
    func resetViewModel() {
        self.viewModel.status = ""
        self.viewModel.totalResults = 0
        self.viewModel.articles = []
        self.totalResults = 0
        self.fetchMore = false
        self.currentPage = 1
    }

    // MARK: - Helpers
    private func setViewModel(_ response: News) {
        if response.articles.isEmpty {
            return
        }
        self.viewModel.status = response.status
        self.viewModel.totalResults = response.totalResults
        self.viewModel.articles += response.articles
        
        self.totalResults = response.totalResults
        self.presenter?.presentReload()
    }
    
    func getDeviceCountry() -> String {
        guard let deviceCountry = Locale.current.regionCode?.lowercased(),
              let _ = NewsCountry(rawValue: deviceCountry)
        else { return "br" }
        
        return deviceCountry
    }
    
    func getNumberOfRows() -> Int {
        return viewModel.articles.count
    }
    
    func didSelectItem(at index: Int) {
        guard let article = viewModel.articles.get(index: index) else { return }
        selectedArticle = article
        presenter?.presentArticle()
    }
}
