//
//  FilterTableViewController+List.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import Foundation
import UIKit

extension FilterTableViewController {
    
    public override func numberOfSections(in tableView: UITableView) -> Int {
        return FilterListType.allCases.count
    }
    
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return viewModel.sort.count
        case 1:
            return viewModel.category.count
        default:
            break
        }
        return 0
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? FilterTableViewCell else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            let listItem = viewModel.sort[indexPath.row]
            cell.displayFilter(text: listItem, .sortBy)
            selectedSortFilterIndexPath == indexPath ? (cell.accessoryType = .checkmark) : (cell.accessoryType = .none)
        case 1:
            let listItem = viewModel.category[indexPath.row]
            cell.displayFilter(text: listItem, .category)
            selectedCategoryFilterIndexPath == indexPath ? (cell.accessoryType = .checkmark) : (cell.accessoryType = .none)
        default:
            break
        }
        
        return cell
    }
    
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.section {
        case 0:
            interactor?.didSelectItem(at: indexPath.row, filterType: .sortBy)
            self.selectedSortFilterIndexPath = indexPath
        case 1:
            interactor?.didSelectItem(at: indexPath.row, filterType: .category)
            self.selectedCategoryFilterIndexPath = indexPath
        default:
            break
        }
        
        tableView.reloadData()
    }
    
    public override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Ordenação"
        case 1:
            return "Categoria"
        default:
            break
        }
        return ""
    }
    
    public override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as? UITableViewHeaderFooterView
        header?.textLabel?.textColor = UIColor.title
    }
}

extension FilterTableViewController: FilterButtonDelegate {
    func applySelectedFilter() {
        interactor?.applyFilter()
    }
}
