//
//  SearchState.swift
//  Infotainment
//
//  Created by Denny Feng on 5/2/21.
//

import SwiftUI
import Combine
import Foundation


class SearchState: ObservableObject
{
    
    @Published var query = ""
    @Published var movies:[Movie]?
    @Published var shows:[Shows]?
    @Published var isLoading = false
    @Published var error:NSError?
    

    private var subscriptionToken: AnyCancellable?
    
    let fetchShow:FetchTVShowModel
    let fetchMovie:FetchMovieModel
    

    init(fetchMovie: FetchMovieModel = MovieAPIModel.shared
         ,fetchShow: FetchTVShowModel = TVShowAPIModel.shared )
    {
        self.fetchMovie = fetchMovie
        self.fetchShow = fetchShow
    }
    
    func startObserve() {
           guard subscriptionToken == nil else { return }
           
           self.subscriptionToken = self.$query
               .map { [weak self] text in
                   self?.movies = nil
                   self?.shows = nil
                   self?.error = nil
                   return text
                   
           }.throttle(for: 1, scheduler: DispatchQueue.main, latest: true)
               .sink { [weak self] in self?.search(query: $0) }
       }
    
    func search(query: String) {
           self.movies = nil
            self.shows = nil
           self.isLoading = false
           self.error = nil
           
           guard !query.isEmpty else {
               return
           }
        
        
        self.isLoading = true
                self.fetchShow.searchShow(query: query) {[weak self] (result) in
                    guard let self = self, self.query == query else { return }
                    
                    self.isLoading = false
                    switch result {
                    case .success(let response):
                        self.shows = response.results
                    case .failure(let error):
                        self.error = error as NSError
                    }
                }
        
        self.fetchMovie.searchMovie(query: query) { [weak self ] (result) in
            guard let self = self, self.query == query else{
                return}
            self.isLoading = false
            switch result {
            case .success(let response):
            self.movies = response.results
            case .failure(let error):
            self.error = error as NSError
            }
        }
            }
            
            deinit {
                self.subscriptionToken?.cancel()
                self.subscriptionToken = nil
            }

    
}
