//
//  FilterRouter.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

// MARK: - Protocol
protocol FilterRoutingLogic {
}

// MARK: - Communication Data Store
protocol FilterDataPassing {
    var dataStore: FilterDataStore? { get }
}

class FilterRouter: NSObject, FilterRoutingLogic, FilterDataPassing {

    // MARK: - Properties
    weak var viewController: FilterTableViewController?
    var dataStore: FilterDataStore?
}
