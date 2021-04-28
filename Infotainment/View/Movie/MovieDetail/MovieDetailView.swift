//
//  MovieDetailView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import SwiftUI

struct MovieDetailView: View {
    let movieID: Int;
        @ObservedObject private var movieDetailState = MovieDetailViewModel()
        
        var body: some View {
            ZStack{
                LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error)
                {
                    self.movieDetailState.loadMovie(id: self.movieID)
                }
                
                if movieDetailState.movie != nil{
                    MovieDetailLazyView(movies: self.movieDetailState.movie!)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }
                
            }.offset(y:10)
            .navigationBarTitle(movieDetailState.movie?.title ?? "")
            .onAppear{
                self.movieDetailState.loadMovie(id: self.movieID)
            
            }
            
        }
    }




struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            MovieDetailView(movieID: Movie.latestMovie.id)
        }
    }
}
