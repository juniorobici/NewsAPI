//
//  FilterPresenter.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

// MARK: - Protocol
protocol FilterPresentationLogic {
    func presentFilterList(viewModel: Filter)
    func presentCurrentFilter(viewModel: FilterResponse)
    func presentSelectedFilter(viewModel: FilterResponse)
}

class FilterPresenter: FilterPresentationLogic {
    
    // MARK: - Properties
    weak var viewController: FilterDisplayLogic?
    
    // MARK: - FilterPresentationLogic
    func presentFilterList(viewModel: Filter) {
        viewController?.displayFilterList(viewModel: viewModel)
    }
    
    func presentSelectedFilter(viewModel: FilterResponse) {
        if let category = NewsCategory(rawValue: viewModel.category), let sortBy = NewsSortBy(rawValue: viewModel.sort) {
            viewController?.displaySelectedFilter(category: category, sortBy: sortBy)
        }
    }
    
    func presentCurrentFilter(viewModel: FilterResponse) {
        viewController?.displayCurrentFilter(viewModel: viewModel)
    }
}
