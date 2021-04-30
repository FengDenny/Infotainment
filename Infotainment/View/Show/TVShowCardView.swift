//
//  TVShowCardView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import SwiftUI

struct TVShowCardView: View {
    
    let shows: Shows
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
                
                Text(shows.name)
                    .foregroundColor(.white)
                    .font(.primary(.regular, size: 20))
                    .fontWeight(.bold)
                    .padding()
//                    MARK: Color change 
                    .background(Color.blue)
                    .cornerRadius(8)
                    .offset(x: 10, y: 120)
                
            }// end ZStack
            .aspectRatio(1,contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4 )
            .padding()
            .onAppear{
                self.imageLoader.loadImage(with: self.shows.backdropURL)
            }
           
    }// end VStack
        
}
    
}

struct TVShowCardView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowCardView(shows: Shows.latestShow)
    }
}
