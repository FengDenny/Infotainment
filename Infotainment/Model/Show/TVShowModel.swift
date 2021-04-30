//
//  TVShowModel.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import Foundation


struct TVShowModel: Decodable{
    let results:[Shows]
}

struct Shows: Decodable, Identifiable{
    
    let id: Int;
    let name: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let firstAirDate: String?
  
    
    var backdropURL: URL {
          return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
      }
      
      var posterPathURL: URL{
          return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
      }
    
}
