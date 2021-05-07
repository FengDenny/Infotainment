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
            DiscoverMovieImageCarouselView(movies: Movie.discoverMovies)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .tabItem {
                    Image(systemName: "arrowtriangle.right.fill")
                    Text("Discover")
                } // End MovieListView tabItem
            
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
                  Image(systemName: "hand.thumbsup")
                    Text("Recommended")
                        .font(.primary(.regular, size: 50))
                }
            
                SearchView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .tabItem {
                      Image(systemName: "magnifyingglass.circle")
                      Text("Search")
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
