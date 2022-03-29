//
//  UImageView+Extension.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import Foundation
import UIKit

extension UIImageView {
    func downloadImage(url: URL) {
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}
