//
//  ActivityIndicatorView.swift
//  MovieDB
//
//  Created by Denny Feng on 4/25/21.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
  
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
}


