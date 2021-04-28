//
//  Utils.swift
//  MovieDB
//
//  Created by Denny Feng on 4/17/21.
//

import Foundation

class Utility {
    
    static let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        return dateFormatter
    }()
    
    
    static  let yearFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy"
           return formatter
       }()
       
       static  let durationFormatter: DateComponentsFormatter = {
           let formatter = DateComponentsFormatter()
           formatter.unitsStyle = .full
           formatter.allowedUnits = [.hour, .minute]
           return formatter
       }()
}
