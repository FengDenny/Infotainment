//
//  DiscoverMovieTrailerView.swift
//  Infotainment
//
//  Created by Denny Feng on 5/1/21.
//

import SwiftUI

struct DiscoverMovieTrailerView: View {
    let movieID: Int;
        @ObservedObject private var movieDetailState = MovieDetailViewModel()
        
        var body: some View {
            ZStack{
                LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error)
                {
                    self.movieDetailState.loadMovie(id: self.movieID)
                }
                
                if movieDetailState.movie != nil{
                    MovieTrailerView(movies: self.movieDetailState.movie!)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }// end if
                
                
                
            } // end ZStack
            .onAppear{
                self.movieDetailState.loadMovie(id: self.movieID)
            
            }// end opAppear
            
        }// end body
}

struct DiscoverMovieTrailerView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverMovieTrailerView(movieID: Movie.discoverMovie.id)
    }
}
