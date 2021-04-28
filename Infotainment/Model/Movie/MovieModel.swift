//
//  MovieModel.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import Foundation

struct MovieModel: Decodable{
    let results:[Movie]
    
}
struct Movie: Decodable, Identifiable {
    
    var id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    let releaseDate: String?

    
    var backdropURL: URL {
          return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
      }
      
      var posterPathURL: URL{
          return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
      }
    
    
}
