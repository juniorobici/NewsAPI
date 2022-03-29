//
//  String+Extension.swift
//  NewsAPI
//
//  Created by Junior Obici on 29/03/22.
//

import Foundation

extension String {
    func convertStringsDate(_ inputMask: String, _ outputMask: String) -> String {
        //STRING to DATE
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = inputMask
        guard let date = dateFormatter.date(from: self) else { return "" }
        
        //DATE to STRING
        dateFormatter.dateFormat = outputMask
        let currentDateString: String = dateFormatter.string(from: date)
        
        return "\(currentDateString.uppercased())"
    }
    
    func removeTruncated(string: String) -> String {
        if let endIndex = self.range(of: string)?.lowerBound {
            return String(self[..<endIndex])
        }
        return self
    }
}
