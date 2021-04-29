//
//  ContentView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/27/21.
//

import SwiftUI

struct MainView: View {
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor.black
    }
    
    var body: some View {
        
        TabView{
            MoviesShowsHomeScreenView()
                .tabItem {
                    Image(systemName: "house.circle")
                    Text("Home")
                } // End MovieListView tabItem
        }.accentColor(.white) // End  TabView
        
    }// End body
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
