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
    
    static var animeShows:[Shows]
    {
        let response: TVShowModel? = try? Bundle.main.loadAndDecodeJSON(filename: "tv_show_anime_list")
        return response!.results
    }
    
    static var animeShow:Shows
    {
        animeShows[0]
    }
    
    static var koreanShows:[Shows]
    {
        let response: TVShowModel? = try? Bundle.main.loadAndDecodeJSON(filename: "tv_show_korean_list")
        return response!.results
    }
    
    static var koreanShow:Shows
    {
        koreanShows[0]
    }
    

}
