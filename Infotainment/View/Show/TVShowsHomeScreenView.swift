//
//  TVShowsHomeScreenView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/30/21.
//

import SwiftUI

struct TVShowsHomeScreenView: View {

@ObservedObject private var airingToday = TVShowListViewModel()
@ObservedObject private var upcoming = TVShowListViewModel()
@ObservedObject private var topRated = TVShowListViewModel()
@ObservedObject private var airing = TVShowListViewModel()
@ObservedObject private var popular = TVShowListViewModel()
@ObservedObject private var discover = TVShowListViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
               LazyVStack{
                
                
                Group{
                    if(airingToday.shows != nil){
                        
                        TVShowImageScrollHStackView(title: "New Episodes", shows: airingToday.shows!)
                    }else
                    {
                        LoadingView(isLoading: airingToday.isLoading, error: self.airingToday.error){
                            self.airingToday.loadShows(with:.airingToday)
                    }
                }
                
                }// end airingToday group
                
                
                Group{
                    if(popular.shows != nil){
                        
                        
                        TVShowImageScrollHStackView(title: "Popular Shows", shows: popular.shows!)
                    }else
                    {
                        LoadingView(isLoading: popular.isLoading, error: self.popular.error){
                            self.popular.loadShows(with:.popular)
                    }
                }
                
                }// end popular group
                
                
                Group{
                    if(popular.shows != nil){
                        
                        
                        AnimeShowScrollHStackView(title: "Anime", shows: Shows.animeShows)
                    }
                
                }// end anime group
                
                Group{
                    if(popular.shows != nil){
                        KoreanShowScrollVStackView(title: "Korean Dramas", shows: Shows.koreanShows)
                    }
                
                }// end korean group
                
                
                } // End LazyVStack
                
             }// end ScrollView
            .background(Color.primaryDarkBackground)
            .navigationBarTitle("Infotainment", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = UIColor( Color.primaryDark)
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor(Color.softOrange)]
                       })// end background
            
        }
        .accentColor(Color.softOrange) // end NavigationView
        .onAppear{
            self.airingToday.loadShows(with: .airingToday)
            self.popular.loadShows(with: .popular)
        }
        
    } // end body
    
}

struct TVShowsHomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowsHomeScreenView()
    }
}
