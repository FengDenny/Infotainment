//
//  MovieListView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import SwiftUI

struct MoviesHomeScreenView: View {
    
//    MARK: @ObservedObject
//  allows instances of this class to be used inside views, so that when important changes happen the view will reload.
    
    @ObservedObject private var nowPlaying = MovieListViewModel()
    @ObservedObject private var upcoming = MovieListViewModel()
    @ObservedObject private var topRated = MovieListViewModel()
    @ObservedObject private var popular = MovieListViewModel()
  

    
    var body: some View {
        NavigationView
        {
            ScrollView
            {
                LazyVStack
                {
                    Group{
                    if( nowPlaying.movies != nil){
                        MovieScrollHStackView(title: "Latest Movies", movies: nowPlaying.movies!)
                    }else{
                        LoadingView(isLoading: nowPlaying.isLoading, error: self.nowPlaying.error){
                            self.nowPlaying.loadMovies(with:.nowPlaying)
                        }
                        
                    }// end else
                        
                    } //End nowPlaying Group
                    
                    Group{
                    if( upcoming.movies != nil){
                        MovieImageScrollHStackView(title: "Upcoming Movies ", movies: upcoming.movies!)
                    }else{
                        LoadingView(isLoading: upcoming.isLoading, error: self.upcoming.error){
                            self.upcoming.loadMovies(with:.upcoming)
                        }
                        
                    }// end else
                        
                } //End topRated Group
                    
                } // End LazyVStack
                
            }// End ScrollvIEW
            .background(Color.primaryDarkBackground)
            .navigationBarTitle("Infotainment", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = UIColor( Color.primaryDark)
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor(Color.softOrange)]
                       })// end background
        }// End NavigationView
       
        .accentColor(.white)
        .onAppear{
            self.nowPlaying.loadMovies(with: .nowPlaying)
            self.upcoming.loadMovies(with: .upcoming)
        }
    }
}

struct MoviesHomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesHomeScreenView()
          
    }
}
