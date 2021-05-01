//
//  MovieImageView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import SwiftUI

struct MovieImageOverviewView: View {
    
// MARK: Instantiate Movie Model
    let movie: Movie
    
// MARK: @StateObject
// StateObject instance does not get destroyed when the view updates
    @StateObject var imageLoader = ImageLoader()
    @State private var showDetail = false
    
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
                .offset(x: 140, y:-140)
                
                    Text("\(movie.title) | \(movie.score)")
                        .font(.primary(.regular, size: 20))
                        .foregroundColor(.white)
                        .padding()
                        .offset(x: 10, y: 120)
               
                
            }// end ZStack
            .aspectRatio(1,contentMode: .fit)
            .cornerRadius(2)
            .shadow(radius:10)
           
            Divider()
                .background(Color.white)
                .padding(.trailing)
                .padding(.leading)
                .offset(y: 4)
            
            Text(movie.overview)
                .foregroundColor(Color.primaryDarkBackground)
                .font(.primary(.regular, size: 15))
                .fontWeight(.medium)
                .padding(10)
        }//end VStack
//        MARK:CHANGE THIS COLOR
        .background(Color.softOrange)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.9), radius: 3, x: 0.0, y: 3)
        .lineLimit(3)
        .onAppear{
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }// end onAppear
        
    }// end body
}// end MovieImageView

struct MovieImageOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        MovieImageOverviewView(movie: Movie.latestMovie).previewLayout(.fixed(width: 500, height: 500))
    }
}
