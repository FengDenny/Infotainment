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
    let lastAirDate: String?

  
    let genres:[ShowGenre]?
    let networks:[Networks]?
    let videos: showVideo?
    let next_episode_to_air: air?
    
    
    var backdropURL: URL {
          return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
      }
      
      var posterPathURL: URL{
          return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
      }
    var rating: String
    {
        let rating = Int(voteAverage)
     
        return "\(rating)"
    }
    
    var score: String{
        guard rating.count > 0 else{
            return "n/a"
        }
        return "\(rating)/10"
    }
    
    
    var genre:String{
        genres?.first?.name ?? "n/a"
    }
    
    var networkName: String{
        networks?.first?.name ?? "n/a"
    }
    
    var networkLogo:URL{
        
        let logoPath = networks?.first?.logo_path
        return URL(string: "https://image.tmdb.org/t/p/w500\(logoPath ?? "")")!
       
    }

    
    var lastAir:String
    {
        lastAirDate ?? "n/a"
    }
    
    var youtubeTrailers: [ShowTrailer]?
       {
           videos?.results.filter{$0.youtubeURL != nil}
       }
    
    
    
}

struct air: Codable {
    struct airDate: Codable{
        let air_date: String?
    }
}

struct ShowGenre: Decodable {
    let name:String
    
}

struct Networks:Decodable{
    let name: String
    let logo_path: String?
}
 


struct showVideo : Decodable{
    let results:[ShowTrailer]
}



struct ShowTrailer: Decodable, Identifiable

{
    let id: String
    let key: String
    let name: String
    let site: String
    
    var youtubeURL: URL?{
        guard site == "YouTube" else
        {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}


