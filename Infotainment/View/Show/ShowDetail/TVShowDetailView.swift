//
//  TVShowDetailView.swift
//  Infotainment
//
//  Created by Denny Feng on 4/30/21.
//

import SwiftUI

struct TVShowDetailView: View {
    let showID: Int;
        @ObservedObject private var showDetailState = TVShowDetailViewModel()
        
        var body: some View {
            ZStack{
                LoadingView(isLoading: self.showDetailState.isLoading, error: self.showDetailState.error)
                {
                    self.showDetailState.loadMovie(id: self.showID)
                }
                
                if (showDetailState.show != nil){
                    TVShowDetailLazyView(show: self.showDetailState.show!)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                }// end if
                
            } // end ZStack
            .background(Color.primaryDarkBackground)
            .offset(y:10)
            .navigationBarTitle(showDetailState.show?.name ?? "")
//            MARK: CHANGE COLOR
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .onAppear{
                self.showDetailState.loadMovie(id: self.showID)
            
            }// end opAppear
            
        }// end body
}

struct TVShowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailView(showID: Shows.latestShow.id)
    }
}
