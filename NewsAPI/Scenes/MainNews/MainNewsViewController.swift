//
//  MainNewsTableViewController.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

// MARK: - Protocol
protocol MainNewsDisplayLogic: AnyObject {
    func displayNews(viewModel: News)
    func displayMessage(title: String, type: MessageType)
    func displayReload()
    func displayArticle()
    func displayLoader()
    func stopLoader()
}

public class MainNewsViewController: UIViewController, MainNewsDisplayLogic {
    
    // MARK: - Properties
    var interactor: MainNewsBusinessLogic?
    var router: (NSObjectProtocol & MainNewsRoutingLogic & MainNewsDataPassing)?
    var viewModel = News()
    let reuseIdentifier = "NewsTableViewCell"
    var selectedNewsCategory: NewsCategory = .general
    var selectedNewsSortBy: NewsSortBy = .relevancy
    var listType: FilterListType = .category
    let activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
    var isLoading: Bool = false
    
    // MARK: - @IBOutlets
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .white
        table.rowHeight = 120
        table.separatorInset = .zero
        table.register(NewsTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        table.frame = view.bounds
        return table
    }()
        
    private lazy var headerView: UIView = {
        let header = UIView()
        header.backgroundColor = .white
        header.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 40)
        return header
    }()
    
    private lazy var footerView: UIView = {
        let header = UIView()
        header.backgroundColor = .white
        header.frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 30)
        return header
    }()
    
    private lazy var labelQtd: UILabel = {
        let label = UILabel()
        label.font = NewsFont.poppinsRegular(ofSize: 12)
        label.textColor = UIColor.subtitle
        label.textAlignment = .left
        label.text = "Carregando notícias..."
        return label
    }()
    
    lazy var labelFooter: UILabel = {
        let label = UILabel()
        label.font = NewsFont.poppinsRegular(ofSize: 12)
        label.textColor = UIColor.subtitle
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = MainNewsInteractor()
        let presenter = MainNewsPresenter()
        let router = MainNewsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View Lifecycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        loadData(category: selectedNewsCategory, sortBy: selectedNewsSortBy)
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    // MARK: - Helpers
    internal func setupView() {
        view.backgroundColor = .systemGroupedBackground
        configureNavigationBar(title: "News", prefersLargeTitles: true)
        
        let filterButton = UIBarButtonItem(image: UIImage.navigation.filter, style: .plain, target: self, action: #selector(self.displayFilter))
        filterButton.accessibilityIdentifier = "filterButton"
        navigationItem.rightBarButtonItem = filterButton
        
        //Table
        view.addSubview(tableView)
        
        //Header
        headerView.addSubview(labelQtd)
        labelQtd.centerY(inView: headerView)
        labelQtd.anchor(top: headerView.topAnchor, left: headerView.leftAnchor, right: headerView.rightAnchor, paddingTop: 12, paddingLeft: 10, paddingRight: 10)
        tableView.tableHeaderView = headerView
        
        //Footer
        footerView.addSubview(labelFooter)
        labelFooter.centerY(inView: footerView)
        labelFooter.anchor(top: footerView.topAnchor, left: footerView.leftAnchor, right: footerView.rightAnchor)
        tableView.tableFooterView = footerView
    }
    
    internal func loadData(category: NewsCategory?, sortBy: NewsSortBy?) {
        if let filterCategory = category, let filterSortBy = sortBy {
            interactor?.fetchNews(category: filterCategory, sortBy: filterSortBy)
            selectedNewsCategory = filterCategory
            selectedNewsSortBy = filterSortBy
        } else {
            interactor?.fetchNews(category: selectedNewsCategory, sortBy: selectedNewsSortBy)
        }
    }
    
    internal func getCategory() -> String {
        guard let category = NewsCategory(rawValue: selectedNewsCategory.rawValue.lowercased())?.description else {
            return ""
        }
        return " de \(category)"
    }
    
    internal func getAllCategories() -> [String] {
        var bottomSheetList: [String] = []
        NewsCategory.allCases.forEach { category in
            bottomSheetList.append(category.rawValue.capitalized)
        }
        return bottomSheetList
    }
    
    internal func getAllSorts() -> [String] {
        var bottomSheetList: [String] = []
        NewsSortBy.allCases.forEach { sort in
            bottomSheetList.append(sort.rawValue)
        }
        return bottomSheetList
    }
    
    internal func resetViewModel() {
        labelQtd.text = "Carregando notícias..."
        self.viewModel.status = ""
        self.viewModel.totalResults = 0
        self.viewModel.articles = []
        interactor?.resetViewModel()
        tableView.reloadData()
    }
    
    // MARK: - Selectors
    @objc func displayFilter() {
        let filter = FilterResponse(category: selectedNewsCategory.rawValue.lowercased(), sort: selectedNewsSortBy.rawValue.lowercased())
        interactor?.setSelectedFilter(filter: filter)
        router?.routeToFilter()
    }
    
}

// MARK: - DisplayLogic
extension MainNewsViewController {
    func displayNews(viewModel: News) {
        self.viewModel.status = viewModel.status
        self.viewModel.totalResults = viewModel.totalResults
        self.viewModel.articles += viewModel.articles
        
        DispatchQueue.main.async {
            self.labelQtd.text = "\(self.viewModel.articles.count) notícias\(self.getCategory())"
            self.tableView.reloadData()
        }
    }
    
    func displayMessage(title: String, type: MessageType) {
        switch type {
        case .success:
            self.showAlert(title, completion: nil)
        case .error:
            self.showError(title)
        }
    }
    
    func displayReload() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func displayArticle() {
        router?.routeToArticle()
    }
    
    func displayLoader() {
        //showLoader(onView: self.navigationController?.view ?? self.view)
    }
    
    func stopLoader() {
        //removeLoader()
    }
    
}

// MARK: - Extension
extension MainNewsViewController: ApplyFilterDelegate {
    func applySelectedFilter(category: NewsCategory, sortBy: NewsSortBy) {
        resetViewModel()
        loadData(category: category, sortBy: sortBy)
    }
}
