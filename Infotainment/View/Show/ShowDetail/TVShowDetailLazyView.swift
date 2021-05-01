//
//  TVShowDetailLazyView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/30/21.
//

import SwiftUI

struct TVShowDetailLazyView: View {
    let show: Shows
 
    
    var body: some View {
       
        ScrollView{
            LazyVStack{
                ZStack{
                TVShowDetailImageView(imageURL: self.show.posterPathURL)
                  
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
            
            }// end LazyVStack
            .background(Color.primaryDarkBackground)
            .cornerRadius(10)
        }// end ScrollView
        
    }
}

struct TVShowDetailLazyView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailLazyView(show: Shows.latestShow)
    }
}
