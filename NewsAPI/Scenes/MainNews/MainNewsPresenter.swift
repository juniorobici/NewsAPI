//
//  MainNewsPresenter.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

// MARK: - Protocol
protocol MainNewsPresentationLogic {
    func presentNews(viewModel: News)
    func presentMessage(title: String, type: MessageType)
    func presentReload()
    func presentArticle()
    func presentLoader()
    func hideLoader()
}

class MainNewsPresenter: MainNewsPresentationLogic {
    
    // MARK: - Properties
    weak var viewController: MainNewsDisplayLogic?
    
    // MARK: - MainNewsPresentationLogic
    func presentNews(viewModel: News) {
        viewController?.displayNews(viewModel: viewModel)
    }
    
    func presentMessage(title: String, type: MessageType) {
        viewController?.displayMessage(title: title, type: type)
    }
    
    func presentReload() {
        viewController?.displayReload()
    }
    
    func presentArticle() {
        viewController?.displayArticle()
    }
    
    func presentLoader() {
        viewController?.displayLoader()
    }
    
    func hideLoader() {
        viewController?.stopLoader()
    }
}
