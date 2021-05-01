//
//  TVShowDetailImageView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/30/21.
//

import SwiftUI

struct TVShowDetailImageView: View {
    @ObservedObject private var imageLoader = ImageLoader()
    
    let imageURL : URL
    
    var body: some View {
        
        let image = self.imageLoader.image
        ZStack
        {
            Rectangle().fill(Color.gray.opacity(0.2))
            if( image != nil)
            {
                Image(uiImage: image!)
                    .resizable()
                    .frame(maxWidth:.infinity)
                    .background(Color.black)
                    .opacity(0.6)
            }// end if
            
        } // end ZStack
        .aspectRatio(10/9, contentMode: .fit)
        .onAppear{self.imageLoader.loadImage(with: self.imageURL)}
    } // End body
}

struct TVShowDetailImageView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailImageView(imageURL: Shows.latestShow.networkLogo)
    }
}
