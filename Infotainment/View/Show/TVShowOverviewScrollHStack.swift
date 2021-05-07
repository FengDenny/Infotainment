//
//  TVShowOverviewScrollHStack.swift
//  Infotainment
//
//  Created by Denny Feng on 5/4/21.
//

import SwiftUI

struct TVShowOverviewScrollHStack: View {
    let title: String
    let shows: [Shows]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            
            Text(title)
                .font(.primary(.regular, size: 30))
                .foregroundColor(Color.softOrange)
                .padding(10)
            ScrollView(.horizontal, showsIndicators: false){
                HStack(){
                    
                    ForEach(self.shows){ show in
                            TVShowImageOverviewView(show: show)
                                .frame(width:350, height:  450)
                
                    }// end ForEach
                }// end HStack
                .padding(2)
            }// end ScrollView
            
        }// end VStack
        
    }// end body
}

struct TVShowOverviewScrollHStack_Previews: PreviewProvider {
    static var previews: some View {
        TVShowOverviewScrollHStack(title: "Latest", shows: Shows.latestShows)
    }
}
