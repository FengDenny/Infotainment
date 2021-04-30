//
//  AnimationExtension.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition
    {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}


//    @State private var showDetail = false
//   MARK: Animations View (tiktok image detail feature)
//                Button(action: {
//                    withAnimation{
//                        self.showDetail.toggle()
//                    }
//
//                }, label: {
//                    Image(systemName: "info.circle")
//                    .resizable()
//                    .frame(width: 40, height: 40)
//                    .foregroundColor(.white)
//                    .shadow(color: Color.black.opacity(0.9), radius: 3, x: 0.0, y: 3)
//                })
//
//                if showDetail{
//                    MovieDetailView(movieID: movie.id)
//                        .frame(height:500)
//                        .transition(.moveAndFade)
//                        .onTapGesture{
//                        self.showDetail  = false
//                        }
//                    }
