//
//  UIImage+Extension.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import UIKit

extension UIImage {
    
    struct logo {
        static let news = UIImage(named: "news") ?? UIImage()
        static let newsFill = UIImage(named: "newsFill") ?? UIImage()
    }
    
    struct navigation {
        static let back = UIImage(named: "back") ?? UIImage()
        static let filter = UIImage(named: "filter") ?? UIImage()
        static let ordering = UIImage(named: "ordering") ?? UIImage()
        static let share = UIImage(named: "share") ?? UIImage()
        static let check = UIImage(named: "check") ?? UIImage()
    }
    
    struct newsCategory {
        static let business = UIImage(named: "business") ?? UIImage()
        static let entertainment = UIImage(named: "entertainment") ?? UIImage()
        static let general = UIImage(named: "general") ?? UIImage()
        static let health = UIImage(named: "health") ?? UIImage()
        static let science = UIImage(named: "science") ?? UIImage()
        static let sports = UIImage(named: "sports") ?? UIImage()
        static let technology = UIImage(named: "technology") ?? UIImage()
    }
    
    struct newsSort {
        static let relevancy = UIImage(named: "relevancy") ?? UIImage()
        static let popularity = UIImage(named: "popularity") ?? UIImage()
        static let publishedAt = UIImage(named: "publishedAt") ?? UIImage()
    }
    
}
