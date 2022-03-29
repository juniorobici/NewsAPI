//
//  Array+Extension.swift
//  NewsAPI
//
//  Created by Junior Obici on 28/03/22.
//

import Foundation

extension Array {
    
    public func get(index: Int) -> Element? {
        guard index < count, index >= 0 else {
            return nil
        }
        return self[index]
    }
    
}
