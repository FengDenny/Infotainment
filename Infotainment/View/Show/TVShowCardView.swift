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
    @State private var isShowingSheet = false
    
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
                Button(action: {
                           isShowingSheet.toggle()
                       }) {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                            .shadow(color: Color.black.opacity(0.9), radius: 3, x: 0.0, y: 3)
                          
                       }
                       .sheet(isPresented: $isShowingSheet) {
                        ZStack{
                        TVShowDetailView(showID: shows.id)
                        Button("Dimiss",
                               action: { isShowingSheet.toggle() })
                            .foregroundColor(Color.softOrange)
                            .offset(y:400)
                       }
                       }
                    .offset(x: 120, y:-100)
                Text(shows.name)
                    .foregroundColor(.white)
                    .font(.primary(.regular, size: 15))
                    .fontWeight(.bold)
                    .padding()
//                    MARK: Color change 
                    .background(Color.primaryDarkBackground)
                    .cornerRadius(8)
                    .offset(x: 5, y: 100)
                
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
        NavigationView{
        TVShowCardView(shows: Shows.latestShow)
        }
    }
        
}
