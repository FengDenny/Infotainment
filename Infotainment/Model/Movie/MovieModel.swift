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
    
   
    let genres: [Genre]?
    let credits: Credits?
    let videos:Video?
    

    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    
    var posterPathURL: URL{
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    var genreText: String {
        genres?.first?.name ?? "n/a"
    }
    
    var ratingText: String{
        
        let rating = Int(voteAverage)
        return "\(rating)"
    }
    
    var scoreText: String{
        guard ratingText.count > 0 else{
            return "n/a"
        }
        return "\(ratingText.count)/10"
    }
    
    var yearText: String{
        guard let releaseDate = self.releaseDate, let date = Utility.dateFormatter.date(from: releaseDate) else{
            return "n/a"
        }
        return Utility.yearFormatter.string(from: date)
    }
    
    var durationText: String{
        guard let runTime = self.runtime, runTime > 0 else {
            return "n/a"
        }
        return Utility.durationFormatter.string(from: TimeInterval(runTime) * 60 ) ?? "n/a"
    }
    
    
    var cast:[Cast]?{
        credits?.cast
    }

    var crew: [Crew]?
    {
        credits?.crew
    }
    
    var director: [Crew]?
    {
        crew?.filter{$0.job.lowercased() == "director"}
    }
    
    var producers: [Crew]?
    {
        crew?.filter{$0.job.lowercased() == "producer"}
    }
    
    
    var screenWriters: [Crew]?
    {
        crew?.filter{$0.job.lowercased() == "story"}
    }
    
    var youtubeTrailers: [MovieTrailer]?
    {
        videos?.results.filter{$0.youtubeURL != nil}
    }
    
}





struct Genre: Decodable{
    let name:String
}


struct Credits:Decodable
{
    let cast: [Cast]
    let crew:[Crew]
}

struct Cast: Decodable, Identifiable
{
    let id: Int
    let character: String
    let name: String
}

struct Crew: Decodable, Identifiable
{
    let id: Int
    let job: String
    let name: String
}


struct Video : Decodable{
    let results:[MovieTrailer]
}


struct MovieTrailer: Decodable, Identifiable
{
    let id:String
    let key: String
    let name: String
    let site: String
    
    var youtubeURL: URL?{
        guard site == "YouTube" else{
            
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}
