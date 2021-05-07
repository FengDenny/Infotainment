//
//  TVShowListViewModel.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import Foundation


class TVShowListViewModel: ObservableObject {
    
    @Published var shows: [Shows]?
    @Published var isLoading = false
    @Published var error: NSError?
    
    private let fetchTVShowModel: FetchTVShowModel
    
    
    init(fetchTVShowModel: FetchTVShowModel = TVShowAPIModel.shared)
    {
        self.fetchTVShowModel = fetchTVShowModel
    }
    
    
    func loadShows(with endpoint: ShowEndpoint)
    {
        self.shows = nil
        self.isLoading = false
        // [weak self] to capture nil
        self.fetchTVShowModel.fetchAllShows(from: endpoint) {[weak self] (result) in
            guard let self = self else {return}
            self.isLoading = false
            switch result{
            case .success(let response):
            self.shows = response.results
            case .failure(let error):
            self.error = error as NSError
            }
        }
    }
    
    
    
  
}
