//
//  FilterInteractor.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

protocol FilterBusinessLogic {
    func listFilterOptions()
    func getCurrentFilter()
    func applyFilter()
    func didSelectItem(at index: Int, filterType: FilterListType)
}

public protocol FilterDataStore {
    var selectedFilter: FilterResponse { get set }
}

class FilterInteractor: FilterBusinessLogic, FilterDataStore {
    
    // MARK: - Properties
    var presenter: FilterPresentationLogic?
    var viewModel = Filter()
    
    // MARK: - FilterDataStore
    var selectedFilter = FilterResponse()

    // MARK: - BusinessLogic
    func listFilterOptions() {
        NewsSortBy.allCases.forEach { sort in
            viewModel.sort.append(sort.rawValue)
        }
        NewsCategory.allCases.forEach { category in
            viewModel.category.append(category.rawValue)
        }
        self.presenter?.presentFilterList(viewModel: viewModel)
    }
    
    func getCurrentFilter() {
        presenter?.presentCurrentFilter(viewModel: selectedFilter)
    }
    
    func applyFilter() {
        presenter?.presentSelectedFilter(viewModel: selectedFilter)
    }
    
    func didSelectItem(at index: Int, filterType: FilterListType) {
        switch filterType {
        case .sortBy:
            guard let filter = viewModel.sort.get(index: index) else { return }
            if let sortItem = NewsSortBy(rawValue: filter)?.rawValue {
                selectedFilter.sort = sortItem
            }
        case .category:
            guard let filter = viewModel.category.get(index: index) else { return }
            if let categoryItem = NewsCategory(rawValue: filter)?.rawValue {
                selectedFilter.category = categoryItem
            }
        }
    }

}
