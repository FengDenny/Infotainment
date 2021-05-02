//
//  DiscoverMovieImageCarouselView.swift
//  Infotainment
//
//  Created by Denny Feng on 5/1/21.
//

import SwiftUI

struct DiscoverMovieImageCarouselView: View {
        let movies: [Movie]
        
        var body: some View {
            VStack() {
                GeometryReader { geometry in
                ScrollView() {
                    VStack(spacing:0) {
                        ForEach(self.movies) { movie in
                            ZStack{
                         DiscoverMovieImageView(movie: movie)  .frame(height: geometry.size.height)
                            DiscoverMovieTrailerView(movieID: movie.id)
                                
                            } // end ZStack
                            
                        } // end ForEach
                    }// end VStack
                }// end ScrollView
                } // end GeometryReader
            }
            .edgesIgnoringSafeArea(.all)
        }
}

struct DiscoverMovieImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverMovieImageCarouselView(movies: Movie.discoverMovies)
    }
}
