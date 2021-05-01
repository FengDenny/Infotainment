//
//  FetchMovieModel.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import Foundation


protocol FetchTVShowModel{
    
    func fetchAllShows(from endpoint: ShowEndpoint, completion: @escaping (Result<TVShowModel, ShowError>) -> ())
    func fetchSingleShow(id: Int, completion: @escaping (Result<Shows, ShowError>) -> ())
    func searchShow(query: String, completion: @escaping (Result<TVShowModel, ShowError>) -> ())
}


enum ShowEndpoint: String, CaseIterable, Identifiable {
    
    var id: String { rawValue }
    
    case airingToday = "airing_today"
    case upcoming
    case topRated = "top_rated"
    case popular
    case discover
    case onAir = " on_the_air"
    var description: String {
        switch self {
            case .airingToday: return "Airing Today"
            case .upcoming: return "Upcoming"
            case .topRated: return "Top Rated"
            case .popular: return "Popular"
            case .discover: return "Oncoming"
            case .onAir: return "Now Airing"
        }
    }
}

enum ShowError: Error, CustomNSError {
    
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
