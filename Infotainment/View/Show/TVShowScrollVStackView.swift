//
//  TVShowCarouselView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import SwiftUI

struct TVShowScrollVStackView: View {
    
    let title: String
    let shows: [Shows]
    
    var body: some View {
        VStack(alignment: .leading)
        {
            Text(title)
                .foregroundColor(Color.softOrange)
                .font(.primary(.regular, size: 30))
                .fontWeight(.bold)
                .padding(20)
            ScrollView()
            {
                VStack(spacing:1){
                    ForEach(self.shows){ show in
                        TVShowCardView(shows: show)
                    }
                }
            }
        }
    }
}

struct TVShowCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowScrollVStackView(title: "On Air", shows: Shows.latestShows)
    }
}
