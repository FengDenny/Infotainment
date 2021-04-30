//
//  MovieImageScrollHStackView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import SwiftUI

struct MovieImageScrollHStackView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment:.leading, spacing: 0)
        {
            Text(title)
                .font(.primary(.regular, size: 30))
//                MARK: CHANGE COLOR 
                .foregroundColor(.blue)
                .padding()
                .offset(y:40)
            ScrollView(.horizontal, showsIndicators:false){
                HStack{
                    ForEach(self.movies){ movie in

                            MovieImageView(movie: movie)  .frame(width:350, height:  450)
                    }// end ForEach
                }// end HStack
                
                
                
            }.padding(2)// end ScrollView
            
            
        }// end VStack
    }
}

struct MovieImageScrollHStackView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageScrollHStackView(title: "Upcoming", movies: Movie.latestMovies)
    }
}
