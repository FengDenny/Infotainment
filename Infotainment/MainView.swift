//
//  ContentView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import SwiftUI

struct MainView: View {
    
    init(){
        UITabBar.appearance().barTintColor = UIColor(Color.primaryDark)
    }
    
    var body: some View {
        TabView{
            MoviesHomeScreenView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Image(systemName: "film")
                    Text("Movies")
                } // End MovieListView tabItem
            
                  TVShowsHomeScreenView()
                      .frame(maxWidth: .infinity, maxHeight: .infinity)
                      .tabItem {
                        Image(systemName: "tv.circle")
                        Text("TV Shows")
                      }
            
            TVShowScrollVStackView(title: "On Air", shows: Shows.latestShows)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                  Image(systemName: "antenna.radiowaves.left.and.right")
                  Text("On Air")
                }
              
        } // End  TabView
        .accentColor(Color.softOrange)
        
    }// End body
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
