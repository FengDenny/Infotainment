//
//  MovieDetailLazyView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import SwiftUI

struct MovieDetailLazyView: View{
    
//    let movie: Movie
    let movies: Movie
    
    @State private var selectedTrailer: MovieTrailer?
    
    var body: some View{
        
        ScrollView{
            LazyVStack{
                MovieDetailImageView(imageURL: self.movies.posterPathURL)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                HStack{
                    Text("\(movies.genreText) Film")
                    Text("\(movies.genreText)")
//                    Text("\(movies.duration)")
                    
                    
                }// end HStack
                
                HStack{
                    Text(movies.score)
                }// end HStack
                .offset(y:20)
                
            }// end LazyVStack
            
        }// end ScrollView
        
        
    }// End body
    
}


struct MovieDetailLazyView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailLazyView(movies:Movie.latestMovie )
    }
}
