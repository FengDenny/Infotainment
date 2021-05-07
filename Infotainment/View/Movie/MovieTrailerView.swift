//
//  MovieTrailerView.swift
//  Infotainment
//
//  Created by Denny Feng on 5/1/21.
//

import SwiftUI

struct MovieTrailerView: View {
    let movies: Movie
    
    @State private var selectedTrailer: MovieTrailer?
    
    var body: some View {
        ZStack{
            
            //       MARK: YouTube Trailers
            if movies.youtubeTrailers != nil && movies.youtubeTrailers!.count > 0{
                ForEach(movies.youtubeTrailers!){
                    trailer in Button(action: {
                    self.selectedTrailer = trailer
                    }) {
                    VStack{
                    Text(trailer.name)
                    .font(.primary(.regular, size: 15))
                    .lineLimit(3)
                    .foregroundColor(.white)
                    Image(systemName: "play.circle.fill")
                    .resizable()
                    .frame(maxWidth: 40,maxHeight:40)
                    .foregroundColor(Color.softOrange)
                        
                    } // end ZStack
                    .padding(20)
                    }// end Button
                    .offset(y:10)
                    }// end ForEach
                    .sheet(item: self.$selectedTrailer){
                    trailer in SafariView(url: trailer.youtubeURL!)
                    }
                    }// end if
                    else{
                    Text("No trailers right now. Stay tuned!")
                        .foregroundColor(Color.white)
                        .font(.primary(.regular, size: 20))
                } //end else
            Text("\(movies.yearReleaseDate)")
                .foregroundColor(.white)
                .font(.primary(.regular, size: 30))
                .offset(y:160)
                
        }
    }
}

struct MovieTrailerView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTrailerView(movies: Movie.discoverMovie)
    }
}
