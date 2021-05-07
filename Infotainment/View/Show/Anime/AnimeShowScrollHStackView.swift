//
//  AnimeShowScrollHStackView.swift
//  Infotainment
//
//  Created by Denny Feng on 5/1/21.
//

import SwiftUI

struct AnimeShowScrollHStackView: View {
    let title: String
    let shows: [Shows]
    
    
    var body: some View {
        VStack(alignment:.leading){
            Text(title)
                .foregroundColor(Color.softOrange)
                .font(.primary(.regular, size: 30))
                .fontWeight(.bold)
                .padding()
                .offset(y:20)
            ScrollView(.horizontal){
                HStack(spacing: 1){
                    ForEach(self.shows){ show in
                        TVShowCardView(shows: show)
                            .frame(maxWidth: 350, maxHeight: 400)
                    }

                } // end Srollview VStack
                
            } // end ScrollView
            
        } // end VStack
    } // end Body
}

struct AnimeShowScrollHStackView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeShowScrollHStackView(title: "Anime", shows: Shows.animeShows)
    }
}
