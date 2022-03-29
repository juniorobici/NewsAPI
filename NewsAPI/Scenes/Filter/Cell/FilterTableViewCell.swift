//
//  FilterTableViewCell.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    private lazy var filterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.setDimensions(height: 32, width: 32)
        image.image = UIImage.logo.news
        image.tintColor = UIColor.main
        return image
    }()
    
    private lazy var labelFilterTitle: UILabel = {
        let label = UILabel()
        label.font = NewsFont.poppinsRegular(ofSize: 14)
        label.textColor = UIColor.title
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .right
        label.text = "Title"
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
    
    //MARK: Helpers
    func setupView() {
        self.backgroundColor = .white
        
        //Image
        self.addSubview(filterImage)
        filterImage.anchor(left: leftAnchor, paddingLeft: 20)
        
        //Title
        self.addSubview(labelFilterTitle)
        labelFilterTitle.anchor(top: filterImage.topAnchor, left: filterImage.rightAnchor, bottom: filterImage.bottomAnchor, paddingLeft: 10, paddingRight: 10)
        
    }
    
    func displayFilter(text: String, _ filterType: FilterListType) {
        switch filterType {
        case .sortBy:
            filterImage.image = NewsSortBy(rawValue: text)?.icon
            labelFilterTitle.text = NewsSortBy(rawValue: text)?.description
        case .category:
            filterImage.image = NewsCategory(rawValue: text)?.icon
            labelFilterTitle.text = NewsCategory(rawValue: text)?.description
        }
    }
}
