//
//  MovieImageView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import SwiftUI

struct MovieImageView: View {
    
// MARK: Instantiate Movie Model
    let movie: Movie
    
// MARK: @StateObject
// StateObject instance does not get destroyed when the view updates
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        let image = self.imageLoader.image
        VStack(alignment: .leading){
            ZStack{
                Rectangle().fill(Color.gray.opacity(0.3))
                if(image != nil)
                {
                    Image(uiImage: image!)
                        .resizable()
                }// end if
                
            }// end ZStack
            .aspectRatio(1,contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4 )
            Text(movie.overview).font(.subheadline).fontWeight(.medium).padding(10)
        }//end VStack
        .lineLimit(3)
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }// end onAppear
        
    }// end body
}// end MovieImageView

struct MovieImageView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageView(movie: Movie.latestMovie).previewLayout(.fixed(width: 500, height: 500))
    }
}
