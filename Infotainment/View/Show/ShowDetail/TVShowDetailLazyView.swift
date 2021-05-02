//
//  TVShowDetailLazyView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/30/21.
//

import SwiftUI

struct TVShowDetailLazyView: View {
    let show: Shows
 
    @State private var selectedTrailer: ShowTrailer?
    
    var body: some View {
       
        ScrollView{
            LazyVStack{
                ZStack{
                TVShowDetailImageView(imageURL: self.show.posterPathURL)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                  
                    Text(show.score)
                        .font(.title2)
                        .padding(6)
                        .foregroundColor(.white)
                        .background(Color.softOrange)
                        .cornerRadius(8)
                        .opacity(0.8)
                        .offset(x:150,y:90)
                       
                }// end ZStack
                HStack{
                    Text("\(show.genre)")
                    Text("|")
                    Text("\(show.networkName)")
                    Text("|")
                    Text("Last aired: \(show.lastAirDate ?? "n/a")")
//                    Text("|")
//                    Text("\(movies.duration)")
  
                }// end HStack
                .foregroundColor(.white)
                HStack{
                    Text(show.overview)
                }// end HStacks
                .foregroundColor(.white)
                .padding()
                
                
                
//       MARK: YouTube Trailers
            if show.youtubeTrailers != nil && show.youtubeTrailers!.count > 0{
                                    
                Text("Trailers")
                .font(.primary(.regular, size: 25))
                .foregroundColor(.softOrange)
                ForEach(show.youtubeTrailers!){
                                            
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
                Text("No trailer right now. Stay tuned!").foregroundColor(Color.softOrange)
            } // end else
            
            }// end LazyVStack
            .background(Color.primaryDarkBackground)
            .cornerRadius(10)
        }// end ScrollView
        .background(Color.primaryDarkBackground.edgesIgnoringSafeArea(.all))
    }
}

struct TVShowDetailLazyView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailLazyView(show: Shows.latestShow)
    }
}
