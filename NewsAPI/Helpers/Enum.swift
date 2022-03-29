//
//  Enum.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import Foundation
import UIKit

enum FilterListType: String, CaseIterable {
    case sortBy
    case category
}

enum MessageType {
    case success
    case error
}

public enum NewsCategory: String, CaseIterable {
    case business
    case entertainment
    case general
    case health
    case science
    case sports
    case technology
    
    var description: String {
        switch self {
        case .business: return "Negócios"
        case .entertainment: return "Entretenimento"
        case .general: return "Assuntos gerais"
        case .health: return "Saúde"
        case .science: return "Ciência"
        case .sports: return "Esportes"
        case .technology: return "Tecnologia"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .business: return UIImage.newsCategory.business
        case .entertainment: return UIImage.newsCategory.entertainment
        case .general: return UIImage.newsCategory.general
        case .health: return UIImage.newsCategory.health
        case .science: return UIImage.newsCategory.science
        case .sports: return UIImage.newsCategory.sports
        case .technology: return UIImage.newsCategory.technology
        }
    }
}

public enum NewsSortBy: String, CaseIterable {
    case relevancy
    case popularity
    case publishedAt
    
    var description: String {
        switch self {
        case .relevancy: return "Relevancia"
        case .popularity: return "Popularidade"
        case .publishedAt: return "Publicação recente"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .relevancy: return UIImage.newsSort.relevancy
        case .popularity: return UIImage.newsSort.popularity
        case .publishedAt: return UIImage.newsSort.publishedAt
        }
    }
}

public enum NewsCountry: String, CaseIterable {
    case ae
    case ar
    case at
    case au
    case be
    case bg
    case br
    case ca
    case ch
    case cn
    case co
    case cu
    case cz
    case de
    case eg
    case es
    case fr
    case gb
    case gr
    case hk
    case hu
    case id
    case ie
    case il
    case ind = "in"
    case isl = "is"
    case it
    case jp
    case kr
    case lt
    case lv
    case ma
    case mx
    case my
    case ng
    case nl
    case no
    case nz
    case ph
    case pl
    case pt
    case pk
    case ro
    case rs
    case ru
    case sa
    case se
    case sg
    case si
    case sk
    case th
    case tr
    case tw
    case ua
    case us
    case ve
    case za
    case zh
}
