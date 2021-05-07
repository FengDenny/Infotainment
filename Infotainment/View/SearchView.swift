//
//  SearchView.swift
//  Infotainment
//
//  Created by Denny Feng on 5/2/21.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var  searchState = SearchState()


    var body: some View {
        NavigationView{
                List{
                    SearchBarView(placeholder: "Search", text: self.$searchState.query)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                LoadingView(isLoading: self.searchState.isLoading, error: self.searchState.error)
                {
                    self.searchState.search(query: self.searchState.query)
                    
                } // end LoadingView
                
                        
                if self.searchState.movies != nil
                    && self.searchState.shows != nil
                {
                    ForEach(self.searchState.shows!)
                    {
                        show in NavigationLink(
                            destination: TVShowDetailView(showID: show.id))
                            {
                            VStack(alignment: .leading){
                                Text(show.name)
                                Text(show.firstAirDate ?? "n/a")
                                }// end VStack
                            } // end NavigationLink
                    
                    } // end ForEach
                    .listRowBackground(Color.primaryDarkBackground)
                   
                    
                    ForEach(self.searchState.movies!)
                    {
                        movie in NavigationLink(
                            destination: MovieDetailView(movieID: movie.id))
                            {
                            VStack(alignment: .leading){
                                Text(movie.title)
                                Text(movie.yearReleaseDate)
                                }// end VStack
                            } // end NavigationLink
                    } // end ForEach
                    .listRowBackground(Color.primaryDarkBackground)
                } // end if
            } // end List
                .background(Color.primaryDarkBackground.edgesIgnoringSafeArea(.all))
                .foregroundColor(Color.white)
                
             
            .onAppear{
                self.searchState.startObserve()
                UITableView.appearance().backgroundColor = .clear
                UITableViewCell.appearance().backgroundColor = .clear
//                MARK: Change searchbar search text color
                UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(Color.softOrange)]
                
                // this will disable highlighting the cell when is selected
                   UITableViewCell.appearance().selectionStyle = .none

                   // you can also remove the row separators
                   UITableView.appearance().separatorStyle = .none
               
            }
            .navigationBarTitle("Search", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = UIColor( Color.primaryDark)
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor(Color.softOrange)]
            })
        } // End NavigationView
        .accentColor(.white)
    } // end body
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
