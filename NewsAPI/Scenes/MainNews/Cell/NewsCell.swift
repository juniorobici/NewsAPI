//
//  NewsTableViewCell.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private lazy var newsImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.setDimensions(height: 120, width: self.frame.width * 0.4)
        image.image = UIImage.logo.news
        image.tintColor = UIColor.main
        return image
    }()
    
    private lazy var labelNewsTitle: UILabel = {
        let label = UILabel()
        label.font = NewsFont.poppinsRegular(ofSize: 13)
        label.textColor = UIColor.title
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .left
        label.text = "Title"
        return label
    }()
    
    private lazy var labelNewsSource: UILabel = {
        let label = UILabel()
        label.font = NewsFont.poppinsRegular(ofSize: 12)
        label.textColor = UIColor.subtitle
        label.textAlignment = .right
        label.text = "Source"
        return label
    }()
    
    //MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    //MARK: Helpers
    func setupView() {
        self.backgroundColor = .white
        
        //Image
        self.addSubview(newsImage)
        newsImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeft: 0)
        
        //Title
        self.addSubview(labelNewsTitle)
        labelNewsTitle.anchor(top: newsImage.topAnchor, left: newsImage.rightAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 10, paddingRight: 10)
        
        //Source
        self.addSubview(labelNewsSource)
        labelNewsSource.anchor(top: labelNewsTitle.bottomAnchor, left: newsImage.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 12, paddingLeft: 12, paddingBottom: 12, paddingRight: 12, height: 20)
    }
    
    func displayArticle(article: Article) {
        if let urlString = article.urlToImage, let urlImage = URL(string: urlString) {
            ImageProvider.shared.fetchImage(url: urlImage) { [weak self] image in
                DispatchQueue.main.async {
                    self?.newsImage.image = image
                }
            }
        }
        labelNewsTitle.text = article.title
        labelNewsSource.text = article.source.name
    }
}
