//
//  DiscoverMovieImageView.swift
//  Infotainment
//
//  Created by Denny Feng on 5/1/21.
//

import SwiftUI

struct DiscoverMovieImageView: View {
    let movie: Movie
           @StateObject var imageLoader = ImageLoader()
           
           var body: some View {
               VStack() {
                   ZStack {
                       if self.imageLoader.image != nil {
                           Image(uiImage: self.imageLoader.image!).resizable()
                            .overlay(TintOverlay().opacity(0.45))
                           
                       }
                   } // end ZStack
                   .edgesIgnoringSafeArea(.all)
               } // end VStack
               .lineLimit(2)
               .onAppear {
                   self.imageLoader.loadImage(with: self.movie.posterPathURL)
               } // end onAppear
           }// end body
    
}

struct DiscoverMovieImageView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverMovieImageView(movie: Movie.discoverMovie)
    }
}

struct TintOverlay: View {
  var body: some View {
    ZStack {
      Text(" ")
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color.black)
  }
}
