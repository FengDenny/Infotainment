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
                ZStack{
                MovieDetailImageView(imageURL: self.movies.posterPathURL)
                    .listRowInsets(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
                    Text(movies.score)
                        .font(.title2)
                        .padding(6)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                        .opacity(0.8)
                        .offset(x:150,y:90)
                       
                }// end ZStack
                .frame(width: .infinity, height: .infinity)
                HStack{
                    Text("\(movies.genreText) Film")
                    Text("|")
                    Text("\(movies.yearReleaseDate)")
                    Text("|")
                    Text("\(movies.duration)")
                }// end HStack
                
                HStack{
                    Text(movies.overview)
                }// end HStacks
                .padding()
                
            }// end LazyVStack
            .background(Color.white)
            .cornerRadius(10)
        }// end ScrollView
        
        
    }// End body
    
}


struct MovieDetailLazyView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailLazyView(movies:Movie.latestMovie )
    }
}
