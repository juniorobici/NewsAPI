//
//  FilterTableViewController.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit


// MARK: - Delegate
protocol ApplyFilterDelegate {
    func applySelectedFilter(category: NewsCategory, sortBy: NewsSortBy)
}

// MARK: - Protocol
protocol FilterDisplayLogic: AnyObject {
    func displayFilterList(viewModel: Filter)
    func displayCurrentFilter(viewModel: FilterResponse)
    func displaySelectedFilter(category: NewsCategory, sortBy: NewsSortBy)
}

public class FilterTableViewController: UITableViewController, FilterDisplayLogic {
    
    // MARK: - Properties
    var router: (NSObjectProtocol & FilterRoutingLogic & FilterDataPassing)?
    var interactor: FilterBusinessLogic?
    var viewModel = Filter()
    var delegate: ApplyFilterDelegate?
    private let footerView = FilterButtonFooterView()
    let reuseIdentifier = "FilterTableViewCell"
    let reuseIdentifierApply = "FilterButtonTableViewCell"
    var selectedSortFilterIndexPath: IndexPath? = nil
    var selectedCategoryFilterIndexPath: IndexPath? = nil
    
    // MARK: - @IBOutlets
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = FilterInteractor()
        let presenter = FilterPresenter()
        let router = FilterRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View Lifecycle
    public init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {}
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        configureTableView()
        loadData()
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    // MARK: - Helpers
    internal func setupView() {
        view.backgroundColor = .systemGroupedBackground
        configureNavigationBar(title: "Filtro", prefersLargeTitles: false)
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView = UITableView(frame: tableView.frame, style: .grouped)
        tableView.backgroundColor = .white
        tableView.rowHeight = 50
        tableView.separatorStyle = .none
        tableView.tintColor = UIColor.main
        tableView.register(FilterTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        footerView.delegate = self
        footerView.frame = .init(x: 0, y: 0, width: view.frame.width, height: 50)
        tableView.tableFooterView = footerView
    }
    
    internal func loadData() {
        interactor?.listFilterOptions()
        interactor?.getCurrentFilter()
    }
    
    // MARK: - Selectors
    @objc func applyFilter() {
        interactor?.applyFilter()
    }
}

// MARK: - DisplayLogic
extension FilterTableViewController {
    func displayFilterList(viewModel: Filter) {
        self.viewModel = viewModel
    }
    
    func displayCurrentFilter(viewModel: FilterResponse) {
        if let sortIndex = self.viewModel.sort.firstIndex(where: {$0 == viewModel.sort}) {
            selectedSortFilterIndexPath = IndexPath(row: sortIndex, section: 0)
        }
        
        if let categoryIndex = self.viewModel.category.firstIndex(where: {$0 == viewModel.category}) {
            selectedCategoryFilterIndexPath = IndexPath(row: categoryIndex, section: 1)
        }
    }
    
    func displaySelectedFilter(category: NewsCategory, sortBy: NewsSortBy) {
        delegate?.applySelectedFilter(category: category, sortBy: sortBy)
        navigationController?.popViewController(animated: true)
    }
}


