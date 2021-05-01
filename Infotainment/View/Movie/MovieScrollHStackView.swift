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
                .foregroundColor(Color.softOrange)
                .padding(10)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(){
                    
                    ForEach(self.movies){ movie in
                            MovieImageOverviewView(movie: movie)
                                .frame(width:350, height:  450)
                
                    }// end ForEach
                }// end HStack
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
