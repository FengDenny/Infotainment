//
//  TVShowExtensionModel.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import Foundation


extension Shows{

//    MARK: Latest Movies
    static var latestShows:[Shows]
    {
        let response: TVShowModel? = try? Bundle.main.loadAndDecodeJSON(filename: "tv_show_list")
        return response!.results
    }
    
    static var latestShow: Shows{
        latestShows[0]
    }
    
//    MARK: Oncoming Movies
//    static var discoverMovies:[Movie]
//    {
//        let response: MovieModel? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_discover")
//        return response!.results
//    }
//
//    static var discoverMovie: Movie{
//        discoverMovies[0]
//    }
//
}
