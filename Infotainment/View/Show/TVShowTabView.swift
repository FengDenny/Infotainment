//
//  TVShowImageView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import SwiftUI

struct TVShowTabView: View {
    
    let shows:[Shows]
    
    var body: some View {
        TabView{
            ForEach(self.shows){ show in
                TVShowCardView(shows: show)
                    .frame(width:.infinity, height:.infinity)
                
            }
            
        }// end TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

struct TVShowImageView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowTabView(shows: Shows.latestShows)
    }
}
