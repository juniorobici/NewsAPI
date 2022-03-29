//
//  MainNewsTableViewController+List.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import Foundation
import UIKit

extension MainNewsViewController: UITableViewDataSource, UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        //Infinit Scroll
        if indexPath.row == viewModel.articles.count - 3 && !(interactor?.fetchMore ?? true) && viewModel.articles.count != interactor?.totalResults {
            interactor?.currentPage += 1
            self.loadData(category: selectedNewsCategory, sortBy: selectedNewsSortBy)
        }
        
        //Footer
        if indexPath.row >= viewModel.totalResults - 10 && interactor?.fetchMore == false {
            self.labelFooter.text = "Isso é tudo!"
        } else {
            self.labelFooter.text = "Carregando..."
        }
        
        //Cell
        let article = viewModel.articles[indexPath.row]
        cell.displayArticle(article: article)
        
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor?.didSelectItem(at: indexPath.row)
    }
    
}
