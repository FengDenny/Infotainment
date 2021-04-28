//
//  MovieImageCarouselView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import SwiftUI

struct MovieImageCarouselView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(title).font(.title).fontWeight(.bold).padding(10)
            ScrollView(.horizontal){
                HStack(){
                    ForEach(self.movies){ movie in
                        MovieImageView(movie: movie)
                            .frame(width:350, height:  450)
                           
                    }.padding(10)
                }// end VStack
            }// end ScrollView
        }// end VStack
    }// end body
}// end MovieImageCarouselView

struct MovieImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageCarouselView(title: "Latest", movies: Movie.latestMovies)
    }
}
