//
//  ImageProvider.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import Foundation
import UIKit

class ImageProvider {
    static let shared = ImageProvider()
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    public func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        
        let imageKey: NSString = url.path as NSString
        
        if let image = cache.object(forKey: imageKey) {
            completion(image)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                completion(nil)
                return
            }
            
            DispatchQueue.main.async {
                guard let image = UIImage(data: data) else {
                    completion(nil)
                    return
                }
                
                self?.cache.setObject(image, forKey: imageKey)
                completion(image)
            }
        }
        task.resume()
    }
}
