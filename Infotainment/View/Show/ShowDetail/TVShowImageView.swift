//
//  TVShowImageView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/30/21.
//

import SwiftUI

struct TVShowImageView: View {
    let show: Shows
    @StateObject var imageLoader = ImageLoader()

    var body: some View {
        let image = self.imageLoader.image
        VStack(alignment: .leading){
            ZStack{
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.primaryDarkBackground.opacity(0.3))
                if(image != nil)
                {
                    Image(uiImage: image!)
                        .resizable()
                        .frame(maxWidth:.infinity)
                        .background(Color.black)
                        .opacity(0.6)
                }// end if
                NavigationLink(
                    destination: TVShowDetailView(showID: show.id)
                ){
                Image(systemName: "info.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .shadow(color: Color.black.opacity(0.9), radius: 3, x: 0.0, y: 3)
                }// end NavigationLink
                .offset(x: 120, y:-100)
                
            }// end ZStack
            .background(Color.primaryDarkBackground)
            .aspectRatio(1,contentMode: .fit)
            .cornerRadius(10)
            .shadow(radius:10)
        } // end VStack
        .onAppear{
            self.imageLoader.loadImage(with: show.posterPathURL)
        }
    } // end body
}

struct TVShowImageView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowImageView(show: Shows.latestShow)
    }
}
