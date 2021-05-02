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
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    Text(movies.score)
                        .font(.title2)
                        .padding(6)
                        .foregroundColor(.white)
                        .background(Color.softOrange)
                        .cornerRadius(8)
                        .opacity(0.8)
                        .offset(x:150,y:90)
                       
                }// end ZStack
                HStack{
                    Text("\(movies.genreText)")
                    Text("|")
                    Text("\(movies.yearReleaseDate)")
                    Text("|")
                    Text("\(movies.duration)")
                }// end HStack
                .foregroundColor(.white)
                
                HStack{
                    Text(movies.overview)
                }// end HStacks
                .foregroundColor(.white)
                .padding()
//       MARK: YouTube Trailers
                if movies.youtubeTrailers != nil && movies.youtubeTrailers!.count > 0{
                    
                    Text("Trailers")
                        .font(.primary(.regular, size: 25))
                        .foregroundColor(.softOrange)
                    ForEach(movies.youtubeTrailers!){
                        
                        trailer in Button(action: {
                            self.selectedTrailer = trailer
                        }) {
                            HStack{
                                Text(trailer.name)
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "play.circle.fill")
                                    .foregroundColor(Color.softOrange)
                            } // end HStack
                            .padding(20)
                        }// end Button
                        
                    }// end ForEach
                    .sheet(item: self.$selectedTrailer){
                        trailer in SafariView(url: trailer.youtubeURL!)
                    }
                }// end if
                else{
                    Text("No trailers right now. Stay tuned!").foregroundColor(Color.softOrange)
                } //end else 
              
            }// end LazyVStack
            .background(Color.primaryDarkBackground)
            .cornerRadius(10)
        }// end ScrollView
        
        
    }// End body
    
}


struct MovieDetailLazyView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailLazyView(movies:Movie.latestMovie )
    }
}
