//
//  TVShowImageScrollHStackView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/30/21.
//

import SwiftUI

struct TVShowImageScrollHStackView: View {
    let title: String
    let shows: [Shows]
    
    var body: some View {
        VStack(alignment:.leading, spacing: 0)
        {
            Text(title)
                .font(.primary(.regular, size: 30))
//                MARK: CHANGE COLOR
                .foregroundColor(Color.softOrange)
                .padding()
                .offset(y:20)
            ScrollView(.horizontal, showsIndicators:false){
                HStack{
                    ForEach(self.shows){ show in
                            TVShowImageView(show: show)  .frame(width:300, height:  350)
                    }// end ForEach
                }// end HStack
                
                
                
            }.padding(2)// end ScrollView
            
            
        }// end VStack
    } // end body
}

struct TVShowImageScrollHStackView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowImageScrollHStackView(title: "On Air", shows: Shows.latestShows)
    }
}
