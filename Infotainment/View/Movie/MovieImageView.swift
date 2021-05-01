//
//  MovieImageView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import SwiftUI

struct MovieImageView: View {
    
    let movie: Movie
    @StateObject var imageLoader = ImageLoader()

    var body: some View {
        let image = self.imageLoader.image
        VStack(alignment: .leading){
            ZStack{
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.white.opacity(0.3))
                if(image != nil)
                {
                    Image(uiImage: image!)
                        .resizable()
                        .frame(maxWidth:.infinity)
                        .background(Color.black)
                        .opacity(0.6)
    
                        
                }// end if
                
                
                NavigationLink(
                    destination: MovieDetailView(movieID: movie.id)
                ){
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.9), radius: 3, x: 0.0, y: 3)
                }// end NavigationLink
                .offset(x: 120, y:-100)
                
            }// end ZStack
            .aspectRatio(1,contentMode: .fit)
            .cornerRadius(10)
            .shadow(radius:10)
        } // end VStack
        .onAppear{
            self.imageLoader.loadImage(with: movie.posterPathURL)
        }
    } // end body
}

struct MovieImageView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageView(movie: Movie.latestMovie)
    }
}
