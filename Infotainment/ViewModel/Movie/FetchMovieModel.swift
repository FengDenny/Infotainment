//
//  FetchMovieModel.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import Foundation

protocol FetchMovieModel{
    
    
    func fetchAllMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieModel, MovieError>) -> ())
       func fetchSingleMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ())
       func searchMovie(query: String, completion: @escaping (Result<MovieModel, MovieError>) -> ())
}


enum MovieListEndpoint: String, CaseIterable, Identifiable {
    
    var id: String { rawValue }
    
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    case discover
    var description: String {
        switch self {
            case .nowPlaying: return "Now Playing"
            case .upcoming: return "Upcoming"
            case .topRated: return "Top Rated"
            case .popular: return "Popular"
            case .discover: return "Oncoming"
        }
    }
}

enum MovieError: Error, CustomNSError {
    
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
    
    var localizedDescription: String {
        switch self {
        case .apiError: return "Failed to fetch data"
        case .invalidEndpoint: return "Invalid endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No data"
        case .serializationError: return "Failed to decode data"
        }
    }
    
    var errorUserInfo: [String : Any] {
        [NSLocalizedDescriptionKey: localizedDescription]
    }
    
}
