//
//  MovieImageCarouselView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import SwiftUI

struct MovieScrollHStackView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(title)
                .font(.primary(.regular, size: 30))
                .padding(10)
            ScrollView(.horizontal){
                HStack(){
                    ForEach(self.movies){ movie in
                        MovieImageView(movie: movie)
                            .frame(width:350, height:  450)
                           
                    }
                }// end VStack
                .padding(2)
            }// end ScrollView
            
        }// end VStack
        
    }// end body
}// end MovieImageCarouselView

struct MovieScrollHStackView_Previews: PreviewProvider {
    static var previews: some View {
        MovieScrollHStackView(title: "Latest", movies: Movie.latestMovies)
    }
}
