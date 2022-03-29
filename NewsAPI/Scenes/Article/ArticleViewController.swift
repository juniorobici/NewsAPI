//
//  ArticleViewController.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

// MARK: - Protocol
protocol ArticleDisplayLogic: AnyObject {
    func displayArticle(viewModel: Article)
}

public class ArticleViewController: UIViewController, ArticleDisplayLogic {
    
    // MARK: - Properties
    var router: (NSObjectProtocol & ArticleRoutingLogic & ArticleDataPassing)?
    var interactor: ArticleBusinessLogic?
    var viewModel = Article()
    
    // MARK: - @IBOutlets
    private lazy var newsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.setDimensions(height: view.frame.height * 0.25, width: view.frame.width)
        image.tintColor = UIColor.main
        return image
    }()
    
    private let buttonBack: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage.navigation.back, for: .normal)
        button.setHeight(height: 32)
        button.tintColor = UIColor.main
        button.addTarget(ArticleViewController.self, action: #selector(closeArticle), for: .touchUpInside)
        return button
    }()
    
    private let buttonShare: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage.navigation.share, for: .normal)
        button.setHeight(height: 32)
        button.tintColor = UIColor.main
        button.addTarget(ArticleViewController.self, action: #selector(shareArticle), for: .touchUpInside)
        return button
    }()
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.font = NewsFont.poppinsBold(ofSize: 22)
        label.textColor = UIColor.title
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    private lazy var labelPublished: UILabel = {
        let label = UILabel()
        label.font = NewsFont.poppinsRegular(ofSize: 12)
        label.textColor = UIColor.subtitle
        label.textAlignment = .right
        return label
    }()
    
    private lazy var labelDescription: UILabel = {
        let label = UILabel()
        label.font = NewsFont.poppinsRegular(ofSize: 16)
        label.textColor = UIColor.title
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        return label
    }()
    
    private lazy var labelAuthor: UILabel = {
        let label = UILabel()
        label.font = NewsFont.poppinsRegular(ofSize: 14)
        label.textColor = UIColor.subtitle
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = ArticleInteractor()
        let presenter = ArticlePresenter()
        let router = ArticleRouter()
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
        loadData()
    }
    
    public override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    // MARK: - Helpers
    internal func setupView() {
        view.backgroundColor = .white
        configureNavigationBar(title: "Noticia", prefersLargeTitles: false)
        
        let backButton = UIBarButtonItem(image: UIImage.navigation.back, style: .plain, target: self, action: #selector(self.closeArticle))
        navigationItem.leftBarButtonItem = backButton
        
        let shareButton = UIBarButtonItem(image: UIImage.navigation.share, style: .plain, target: self, action: #selector(self.shareArticle))
        navigationItem.rightBarButtonItem = shareButton
        
        // Title
        view.addSubview(labelTitle)
        labelTitle.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(newsImage)
        newsImage.anchor(top: labelTitle.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 16)
        
        // Published
        view.addSubview(labelPublished)
        labelPublished.anchor(top: newsImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 4, paddingLeft: 16, paddingRight: 16)
        
        // Article
        view.addSubview(labelDescription)
        labelDescription.anchor(top: labelPublished.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 12, paddingLeft: 16, paddingRight: 16)
        
        // Author
        view.addSubview(labelAuthor)
        labelAuthor.anchor(top: labelDescription.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 8, paddingLeft: 16, paddingRight: 16)
    }
    
    internal func loadData() {
        interactor?.setArticle()
    }
    
    internal func showData() {
        
        if viewModel.title == "" || viewModel.title.isEmpty {
            self.closeArticle()
        }
        
        labelTitle.text = viewModel.title
        
        if let urlString = viewModel.urlToImage, let urlImage = URL(string: urlString) {
            ImageProvider.shared.fetchImage(url: urlImage) { [weak self] image in
                DispatchQueue.main.async {
                    self?.newsImage.image = image
                }
            }
        }
        
        labelDescription.text = viewModel.content
        
        labelPublished.text = viewModel.publishedAt
        
        if let author = viewModel.author {
            labelAuthor.text = "\(author) - \(viewModel.source.name)"
        } else {
            labelAuthor.text = viewModel.source.name
        }
    }
    
    // MARK: - Selectors
    
    @objc func closeArticle() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func shareArticle() {
        var items = [Any]()
        items = [viewModel.source.name, viewModel.title, viewModel.url]
        let ac = UIActivityViewController(activityItems: items, applicationActivities: nil)
        navigationController?.present(ac, animated: true)
    }
    
}

// MARK: - DisplayLogic
extension ArticleViewController {
    func displayArticle(viewModel: Article) {
        self.viewModel = viewModel
        self.showData()
    }
}
