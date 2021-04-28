//
//  MovieExtensionModel.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import Foundation


extension Movie{

//    MARK: Latest Movies
    static var latestMovies:[Movie]
    {
        let response: MovieModel? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_list")
        return response!.results
    }
    
    static var latestMovie: Movie{
        latestMovies[0]
    }
    
//    MARK: Oncoming Movies
    static var discoverMovies:[Movie]
    {
        let response: MovieModel? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_discover")
        return response!.results
    }
    
    static var discoverMovie: Movie{
        discoverMovies[0]
    }
    
}
