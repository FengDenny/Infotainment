//
//  MovieDetailViewModel.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import Foundation

class MovieDetailViewModel: ObservableObject
{
    private  let movieService: FetchMovieModel
    @Published var movie: Movie?
    @Published var isLoading = false;
    @Published var error: NSError?
    
    init(movieService: FetchMovieModel = MovieAPIModel.shared )
    {
        self.movieService = movieService
    }
    
    func loadMovie(id: Int){
        self.movie = nil
        self.isLoading = false
        self.movieService.fetchSingleMovie(id: id) {[weak self] (result) in
            guard let self = self else {return}
            self.isLoading = false
            switch result {
            case .success(let movie):
            self.movie = movie
            case .failure(let error):
            self .error = error as NSError
            }
        }
    }
    
}
