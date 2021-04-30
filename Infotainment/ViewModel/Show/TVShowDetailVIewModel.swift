//
//  TVShowDetailVIewModel.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import Foundation


class TVShowDetailViewModel: ObservableObject
{
    
    private  let tvShowService: FetchTVShowModel
    @Published var show: Shows?
    @Published var isLoading = false;
    @Published var error: NSError?
    
    init(tvShowService: FetchTVShowModel = TVShowAPIModel.shared )
    {
        self.tvShowService = tvShowService
    }
    
    func loadMovie(id: Int){
        self.show = nil
        self.isLoading = false
        self.tvShowService.fetchSingleShow(id: id) {[weak self] (result) in
            guard let self = self else {return}
            self.isLoading = false
            switch result {
            case .success(let show):
            self.show = show
            case .failure(let error):
            self .error = error as NSError
            }
        }
    }
    
}
