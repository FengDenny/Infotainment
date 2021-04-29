//
//  MovieListView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import SwiftUI

struct MoviesShowsHomeScreenView: View {
    
//    MARK: @ObservedObject
//  allows instances of this class to be used inside views, so that when important changes happen the view will reload.
    
    @ObservedObject private var nowPlaying = MovieListViewModel()
    @ObservedObject private var upcoming = MovieListViewModel()
    @ObservedObject private var topRated = MovieListViewModel()
    @ObservedObject private var popular = MovieListViewModel()
  

    
    var body: some View {
        NavigationView
        {
            ScrollView
            {
                LazyVStack
                {
                    Group{
                    if( nowPlaying.movies != nil){
                        MovieScrollHStackView(title: "Latest", movies: nowPlaying.movies!)
                    }else{
                        LoadingView(isLoading: nowPlaying.isLoading, error: self.nowPlaying.error){
                            self.nowPlaying.loadMovies(with:.topRated)
                        }
                    }
                    } //End nowPlaying Group
                } // End LazyVStack
                
            }// End ScrollvIEW
            
        }// End NavigationView
        .onAppear{
            self.nowPlaying.loadMovies(with: .upcoming)
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesShowsHomeScreenView()
    }
}
