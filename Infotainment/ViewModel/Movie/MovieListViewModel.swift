//
//  MovieListState.swift
//  MovieDB
//
//  Created by Denny Feng on 4/25/21.
//

import SwiftUI

class MovieListViewModel: ObservableObject {
    
    @Published var movies: [Movie]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    private let fetchMovieModel: FetchMovieModel
    
    
    init(fetchMovieModel: FetchMovieModel = MovieAPIModel.shared)
    {
        self.fetchMovieModel = fetchMovieModel
    }
    
    
    func loadMovies(with endpoint: MovieListEndpoint)
    {
        self.movies = nil
        self.isLoading = false
        // [weak self] to capture nil
        self.fetchMovieModel.fetchAllMovies(from: endpoint) {[weak self] (result) in
            guard let self = self else {return}
            self.isLoading = false
            switch result{
            case .success(let response):
            self.movies = response.results
            case .failure(let error):
            self.error = error as NSError
            }
        }
    }
    
    
    
  
}

